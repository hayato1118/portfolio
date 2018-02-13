class UsersController < ApplicationController
  def index
     @user = User.find(params[:id])
  end

  def show
      @user = User.find(params[:id])
  end

  def new
     # @user = User.new
    cart = Cart.new
    cart.user_id = current_user.id
    cart.save
    redirect_to products_path
  end

  def edit
    @user = User.find(params[:id])
  end


  def update

        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to products_path
      # @user = User.find(params[:id])
      # @user.attributes = user_params
      # if @user.save
      #   redirect_to user_path(@user.id)
      # else
      #   render :edit
      # end
  end


  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  

  private
  def user_params
    params.require(:user).permit(:last_name_kana,:first_name,:first_name_kana,:nickname,:email,:profile_image,:introduction,:phone_number1,:phone_number2,:phone_number3,:github_id,:google_drive_id,:state,:city,:street,:zip)
  end

  # def product_params
  #         params.require(:product).permit.permit(:user_id, :price, :image, :title, :url, :product_detail,
  #           categories_attributes: [:id, :product_id, :category_name, :_destroy]
  #         )
  # end
end