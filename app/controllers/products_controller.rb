class ProductsController < ApplicationController
before_action :authenticate_user!,{only: [:new,:create,:edit,:update,:destroy]}

  def index
       #検索機能
       @products = Product.all.reverse_order
       @product_paginate = Product.page(params[:page]).search(params[:search])
       @good_rank = Product.find(ProductGood.group(:product_id).order('count(product_id) desc').limit(5).pluck(:product_id))
        # @page_rank = Product.find(Impressionist.group(:product_id).order('count(product_id) desc').limit(3).pluck(:product_id))
  end


  def show
      @products = Product.find(params[:id])
      # いいね機能
      @product_good = ProductGood.new()
      @tags = @products.tags
      @categories = @products.categories
      @product_comment = ProductComment.new
      @product_comments = @products.product_comments.page(params[:page]).reverse_order
      impressionist(@products, nil, :unique => [:session_hash])
      # showページの情報を保存
      @products.update(page_count: @products.impressionist_count)
      @products.update(like_count: @products.product_goods.count)
      # ユーザーの販売商品を表示するため
      render :layout => 'product.show.application'

  end


  def new
  	   @product = Product.new
  end

  def create
	    @product = Product.new(product_params)
      @product.user_id = current_user.id
      @product.save
      redirect_to products_path
  end

  def edit
      @products = Product.find(params[:id])
  end

  def update
        @product = Product.find(params[:id])
        @product.update(product_params)
        redirect_to product_path(@product.id)
  end

  def destroy
        @product = Product.find(params[:id])
        @product.delete
        redirect_to products_path

        # 論理削除用
        # モデルでsoft_deleteを定義してflagを追加してそのフラグで表示、非表示をできるようにする。
        # @product.soft_delete
  end



  private
    def product_params
      params.require(:product).permit(:like_count, :admin_id,:buyer_id,:page_count, :user_id, :price, :image, :title, :url, :product_detail,
        :tags_attributes => [:id, :tag_name, :product_id,  :_destroy],category_ids: [],)
    end
end
