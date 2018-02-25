class Admins::ProductsController < ApplicationController
before_action :authenticate_admin!
layout 'admin.application'

# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
	def index
		@products = Product.search(params[:search]).reverse_order
		@product_paginate = Product.page(params[:page]).reverse_order
	end

	def show
		@products = Product.find(params[:id])
		# @tags = @product.tags
		# @categories = @product.categories
	end

	def edit
		@products = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to admins_product_path(@product)
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admins_products_path
	end

	private
		def product_params
			params.require(:product).permit(:admin_id,:buyer_id,:page_count, :user_id, :price, :image, :title, :url, :product_detail, :tags_attributes => [:id, :tag_name, :product_id,  :_destroy],category_ids: [],)
		end
end


# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
