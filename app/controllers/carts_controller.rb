class CartsController < ApplicationController
 before_action :authenticate_user!
 
	  def show
	      @cart = Cart.find(params[:id])
				@teika =0
				@total_count = 0
				@cart.product_carts.each do |product_cart|
					@teika += product_cart.product.price
					@total_count += product_cart.quantity
				end

	      if current_user.id != @cart.id
	  	   	redirect_to root_path
	  	  end
	  end


	 def update

	 	@cart = Cart.find(params[:id])
		@cart.update(cart_params)

		@teika =0
		@total_count = 0
        @cart.product_carts.each do |product_cart|
        @teika += product_cart.product.price
        @total_count += product_cart.quantity
    	end

		if @cart.order_point <= current_user.point && @teika >= @cart.order_point
		redirect_to new_order_path
		else
		render 'show'
		end
	 end



 	def create
	    @cart = Cart.new(cart_params)
	    @cart_id = current_user.cart.id
        @cart.save
        redirect_to cart_path(current_user.cart.id)
   	end

   private
    def cart_params
    params.require(:cart).permit(:order_point,:user_id)
  end
end