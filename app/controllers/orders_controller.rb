class OrdersController < ApplicationController
 before_action :authenticate_user!

  def show
     @order = Order.find(params[:id])
     render :layout => 'order.show.application'
  end


  def new
  	@order = Order.new
  end

  def create
  	@order = Order.new(order_params)

  	@order.user_id = current_user.id
  	if @order.save
      @user = current_user
  		product_carts = current_user.cart.product_carts
  		product_carts.each do |product_cart|
  			product_order = ProductOrder.new
  			product_order.product_id = product_cart.product_id
  			product_order.order_id = @order.id
        product_order.quantity = product_cart.quantity

        product_order.used_point = product_cart.cart.order_point
        # @user.point += @order.get_point
  			product_cart.destroy
  		end
        # 残りのポイント=持っているポイント-使ったポイント+もらったポイント
      @user.point = @user.point - @order.used_point + @order.get_point
      @user.update(point: @user.point)
  	end
  	redirect_to order_complete_path(@order)
  end




  def sold
    @orders = Order.all.reverse_order
  end


  private
    def order_params
    params.require(:order).permit(:get_point,:used_point, :total_price, :zip, :state, :city, :street,:admin_id,:user_id,:phone_number1,:phone_number2,:phone_number3,:last_name,:last_name_kana,:first_name,:first_name_kana,:email)
    end

    def product_order_params
      params.require(:product_order).permit(:product_id, :order_id)
    end

    def user_params
       params.require(:user).permit(:point, :last_name,:last_name_kana,:first_name,:first_name_kana,:nickname,:email,:profile_image,:introduction,:phone_number1,:phone_number2,:phone_number3,:state,:city,:street,:zip,:twitter_id ,:facebook_id ,:instagram_id)
    end

end