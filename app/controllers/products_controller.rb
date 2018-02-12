class ProductsController < ApplicationController
before_action :authenticate_user!,{only: [:new,:create,:edit,:update,:destroy]}

  def index
  	   @products = Product.page(params[:page]).reverse_order
       @productc = Product.all
  end

  def show
      @products = Product.find(params[:id])
      # binding.pry

      @tags = @products.tags
      @product_comment = ProductComment.new
      @product_comments = @products.product_comments.page(params[:page]).reverse_order
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
        @product.destroy
        redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:user_id, :price, :image, :title, :url, :product_detail, :tags_attributes => [:id, :tag_name, :product_id,  :_destroy])
    end
end
