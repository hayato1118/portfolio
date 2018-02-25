class ProductCartsController < ApplicationController


 	def create
	    @product_cart = ProductCart.new(product_cart_params)
	    # binding.pry
	    @product_cart.cart_id = current_user.cart.id

        # if @product_cart.product_by?(@product_cart.product_id,@product_cart.cart_id)
        	@product_cart.save
        # else
        	redirect_to cart_path(current_user.cart.id)
    	end

	 # end

	 def destroy
	 	@product_cart = ProductCart.find_by(:cart_id => current_user.cart.id, :product_id => params[:product_id])
        @product_cart.destroy
        redirect_to cart_path(current_user.cart.id)
	 end


	 private
	 	def product_cart_params
	 		params.permit(:product_id, :cart_id)
	 	end

end