class OrdersController < ApplicationController
 before_action :authenticate_user!

  def show
     @order = Order.find(params[:id])
     render :layout => 'order.show.application'
  end


  def new
  	@order = Order.new
  end


def pay
    @order = Order.new(order_params)
   #  get_point: params[:get_point],
   # used_point: params[:used_point],
   # zip: params[:zip],
   # state: params[:state],
   # city: params[:city],
   # street: params[:street],
   # user_id: current_user.id,
   # phone_number1: params[:phone_number1],
   # phone_number2: params[:phone_number2],
   # phone_number3: params[:phone_number3],
   # last_name: params[:last_name],
   # last_name_kana: params[:last_name_kana],
   # first_name: params[:first_name],
   # first_name_kana: params[:first_name_kana],
   # email: params[:email]

    # @order.get_point = params[:get_point]
    # @order.used_point = params[:used_point]
    # @order.zip = params[:zip]
    # @order.state = params[:state]
    # @order.city = params[:city]
    # @order.street = params[:street]
    # @order.phone_number1 = params[:phone_number1]
    # @order.phone_number2 = params[:phone_number2]
    # @order.phone_number3 = params[:phone_number3]
    # @order.last_name = params[:last_name]
    # @order.last_name_kana = params[:last_name_kana]
    # @order.first_name = params[:first_name]
    # @order.first_name_kana = params[:first_name_kana]
    # @order.email = params[:email]

    # @order.user_id = current_user.id
      if @order.save
        @user = current_user
        product_carts = current_user.cart.product_carts
            teika =0
            product_carts.each do |product_cart|
              teika = teika + product_cart.product.price
              product_order = ProductOrder.new
              product_order.product_id = product_cart.product_id
              product_order.order_id = @order.id
              product_order.quantity = product_cart.quantity
              product_order.used_point = product_cart.cart.order_point
              # @user.point += @order.get_point
              product_order.save
              product_cart.destroy
              @product = product_cart.product
            end

      Payjp.api_key = 'sk_test_2eb64dfe4aa18b7db911e6e6'
      charge = Payjp::Charge.create(
      :amount => "#{teika - current_user.cart.order_point + 50}",
      :card => params['payjp-token'],
      :currency => 'jpy',
       )
        # 残りのポイント=持っているポイント-使ったポイント+もらったポイント
       @user.point = @user.point - @order.used_point + @order.get_point
       @user.update(point: @user.point)
       redirect_to order_complete_path(@order)
       # @user = product_cart.product.user
       SampleMailer.send_when_order(@order).deliver
       SampleMailer.send_when_buy(@order,@product).deliver
      else
        render 'new'
      end

end


  # def create
  # 	@order = Order.new(:get_point,:used_point, :total_price, :zip, :state, :city, :street,:admin_id,:user_id,:phone_number1,:phone_number2,:phone_number3,:last_name,:last_name_kana,:first_name,:first_name_kana,:email)
  #   @order.get_point = params[:get_point]


  # 	@order.user_id = current_user.id
  #   	if @order.save
  #       @user = current_user
  #       product_carts = current_user.cart.product_carts
  #           product_carts.each do |product_cart|
  #             product_order = ProductOrder.new
  #             product_order.product_id = product_cart.product_id
  #             product_order.order_id = @order.id
  #             product_order.quantity = product_cart.quantity

  #             product_order.used_point = product_cart.cart.order_point
  #             # @user.point += @order.get_point
  #             product_order.save
  #             product_cart.destroy
  #           end
  #           # @product_order = @order.product_orders
  #       SampleMailer.send_when_order(@order).deliver
  #         # 残りのポイント=持っているポイント-使ったポイント+もらったポイント
  #       @user.point = @user.point - @order.used_point + @order.get_point
  #       @user.update(point: @user.point)

  #    Payjp.api_key = 'sk_test_2eb64dfe4aa18b7db911e6e6'
  #   charge = Payjp::Charge.create(
  #   :amount => 3500,
  #   :card => params['payjp-token'],
  #   :currency => 'jpy',
  #    )

  #       redirect_to order_complete_path(@order)
  #     else
  #     	redirect_to new_order_path
  #     end
  # end



  def sold
    @orders = Order.all.reverse_order
  end

  private


    def order_params
    params.permit.merge(
       get_point: params[:get_point],
       used_point: params[:used_point],
       zip: params[:zip],
       state: params[:state],
       city: params[:city],
       street: params[:street],
       user_id: current_user.id,
       phone_number1: params[:phone_number1],
       phone_number2: params[:phone_number2],
       phone_number3: params[:phone_number3],
       last_name: params[:last_name],
       last_name_kana: params[:last_name_kana],
       first_name: params[:first_name],
       first_name_kana: params[:first_name_kana],
       email: params[:email]
   )
    end

    def product_order_params
      params.require(:product_order).permit(:product_id, :order_id)
    end

    def user_params
       params.require(:user).permit(:financial_institution_name,:branch_name,:type_of_account,:account_number,:account_holder_name, :point, :last_name,:last_name_kana,:first_name,:first_name_kana,:nickname,:email,:profile_image,:introduction,:phone_number1,:phone_number2,:phone_number3,:state,:city,:street,:zip,:twitter_id ,:facebook_id ,:instagram_id)
    end




end