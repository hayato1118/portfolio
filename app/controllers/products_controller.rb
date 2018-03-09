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
       @product.tags.build
  end

  def confirm
      @product = Product.new(product_params) # <=POSTされたパラメータを取得
      @product.user_id = current_user.id
      @product.image_id = @product.image.id
      session[:product] = @product
      session[:product].save
      # @product.save
      binding.pry
      render :new if @product.invalid? # <=バリデーションチェックNGなら戻す
      # セッションバージョン

  end

  def create
    # セッションバージョン
      @product = Product.new(session[:product])
    # セッションバージョン
	    # @product = Product.new(product_params)
      @product.user_id = current_user.id
      # @product.image.retrieve_from_cache! params[:cache][:image] この書き方はCarrierWave！！！
      if params[:back]
      render :new
      elsif @product.save
      session[:product] = nil
      redirect_to product_complete_path(@product)
      else
      render :new
      end
  end
      # redirect_to products_path

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
        redirect_to user_sale_path(current_user.id)

        # 論理削除用
        # モデルでsoft_deleteを定義してflagを追加してそのフラグで表示、非表示をできるようにする。
        # @product.soft_delete
  end


  private
    def product_params
      params.require(:product).permit(:user_id,:price,:image,:title,:url,:product_detail,:page_count,:admin_id,:like_count,:deleted_at,
        :tags_attributes => [:id, :tag_name, :product_id,  :_destroy],category_ids: [])
    end
end
