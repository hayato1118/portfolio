class CartsController < ApplicationController
 before_action :authenticate_user!
 
   private
    def cart_params
    params.require(:cart).permit(:user_id)
  end
end