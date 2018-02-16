class UsersController < ApplicationController

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
    # binding.pry
        @user = User.find(params[:id])
        if @user.update(user_params)
           redirect_to user_path(@user.id)
        else
           render :edit
        end
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

  def favorite
    @user = User.find(params[:id])
    #特定のユーザーが登録したお気に入りを全て取得する
    @favorites = Favorite.where("user_id = ?", @user)
  end

  def history
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:last_name,:last_name_kana,:first_name,:first_name_kana,:nickname,:email,:profile_image,:introduction,:phone_number1,:phone_number2,:phone_number3,:state,:city,:street,:zip,:twitter_id ,:facebook_id ,:instagram_id)
  end


end