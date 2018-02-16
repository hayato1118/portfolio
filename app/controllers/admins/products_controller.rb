class Admins::ProductsController < ApplicationController
layout 'admin.application'

# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー

	def index
		@product = Product.all
	end

	def show
		@products = Product.find(params[:id])
		@tags = @products.tags
		@categories = @products.categories
	end

	def edit
		@products = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to
	end

	private
		def product_params
			params.require(:product).permit(:page_count, :user_id, :price, :image, :title, :url, :product_detail, :tags_attributes => [:id, :tag_name, :product_id,  :_destroy],category_ids: [],)
		end
end


