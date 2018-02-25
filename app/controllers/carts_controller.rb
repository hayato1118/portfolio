class CartsController < ApplicationController
 before_action :authenticate_user!
def show
end

def create
    # cart = Cart.new
    # cart.user_id = current_user.id
    # cart.save
    # redirect_to products_path
end

   private
    def cart_params
    params.require(:cart).permit(:user_id)
  end
end