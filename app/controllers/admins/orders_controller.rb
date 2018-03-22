class Admins::OrdersController < ApplicationController
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
		@orders = Order.page(params[:page]).search(params[:search]).reverse_order
	end

	def show
		@orders = Order.all
		@order = Order.find(params[:id])

@sum = 0
@order.product_orders.each do |product_order|
@sum += product_order.product.price
end


@total_count = 0
@order.product_orders.each_with_index do |product_order,i|
@total_count = i + 1
end

	end

	def edit
		@orders = Order.find(params[:id])
	end

	  def destroy
        @order = Order.find(params[:id])
        @order.destroy
        redirect_to admins_orders_path
  	end


	private

	    def order_params
	    params.require(:order).permit(:admin_id,:user_id,:phone_number1,:phone_number2,:phone_number3,:last_name,:last_name_kana,:first_name,:first_name_kana,:email)
	    end
end


# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
