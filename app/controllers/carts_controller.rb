class CartsController < ApplicationController
 before_action :authenticate_user!
 
	  def show
	      @cart = Cart.find(params[:id])
	      if current_user.id != @cart.id
	  	   	redirect_to root_path
	  	   end
	  end


	 def update
	 	@cart = Cart.find(params[:id])
		@cart.update(cart_params)
		if @cart.order_point <= current_user.point
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