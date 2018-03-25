class ProductsController < ApplicationController
before_action :authenticate_user!,{only: [:new,:create,:edit,:update,:destroy,:confirm]}
# attr_accessor :attr_image
@@refile_image = []
@@session_tag = []
@@session_category = []

  def index
       @products = Product.all.reverse_order
       @product_paginate = Product.search(params[:search])
       @product_paginates = Kaminari.paginate_array(@product_paginate).page(params[:page])
       @good_rank = Product.find(ProductGood.group(:product_id).order('count(product_id) desc').limit(5).pluck(:product_id))
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
      @product = Product.new(product_params)
      @product.user_id = current_user.id
      # if params[:product][:image] != "{}"
      #   @product.image_id = @product.image.id
      # end
      session[:product] = @product
      @@session_tag = session[:product].tags
      @@session_category = session[:product].categories
      @@refile_image = session[:product].image
      if  @product.invalid?
        render :new
      end
  end


  def create
      @product = Product.new(session[:product])
     
      @product.user_id = current_user.id
      @product.tags = @@session_tag
      @product.categories = @@session_category
       @product.image = @@refile_image
          if params[:back]
          render :new
          elsif @product.save
          session[:product] = nil
          redirect_to product_complete_path(@product)
          @@refile_image = []
          @@session_tag = []
          @@session_category = []
          else
          render :new
          end
  end



  def edit
      @products = Product.find(params[:id])
      if @products.user_id != current_user.id
        redirect_to root_path
      end
  end

  def update
        @product = Product.find(params[:id])
        #binding.pry
        @product.update(product_params)
        redirect_to product_path(@product.id)
  end

  def destroy
        @product = Product.find(params[:id])
        @product.delete
        redirect_to products_path
  end


  private
    def product_params
      params.require(:product).permit(:user_id,:price,:image,:title,:url,:product_detail,:page_count,:admin_id,:like_count,
        :tags_attributes => [:id, :tag_name, :product_id,  :_destroy],category_ids: [])
    end
end