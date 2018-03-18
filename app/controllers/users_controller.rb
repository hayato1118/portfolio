class UsersController < ApplicationController
before_action :authenticate_user!,{only: [:new,:create,:edit,:update,:destroy ,:following ,:followers ,:favorite ,:sale ,:history]}


  def show
      @user = User.find(params[:id])
      @mypage_comment = MypageComment.new
      # @mypage_comments = MypageComment.all
      # @mypage_comments = @products.mypage_comments.all
      @mypage_comments = MypageComment.where(from_user_id: @user.id).page(params[:page]).reverse_order
      render :layout => 'user.show.application'
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
         # session[:user] = @user
         # session[:user].update
        if @user.update(user_params)
           # SampleMailer.send_when_update(current_user).deliver
           redirect_to user_path(@user.id)
        else
           render :edit,flash: {notice: "記入形式が異なるものがございます。"}
        end

  end

  def destroy
        # 論理削除
      @user = User.find(params[:id])
      @user.soft_delete
      sign_out(@user)
      redirect_to root_path
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
    @favorites = Favorite.where("user_id = ?", @user)
  end


  def sale
      @user = User.find(params[:id])
      @product = Product.new
      @products = @user.products.page(params[:page]).reverse_order
      render :layout => 'user.show.application'
  end

  def history
    @user = User.find(params[:id])
    # binding.pry
    # @products = @user.products.page(params[:page]).reverse_order
  end

  private

  def user_params
    params.require(:user).permit(:financial_institution_name, :branch_name, :type_of_account, :account_number, :account_holder_name, :point, :last_name,:last_name_kana,:first_name,:first_name_kana,:nickname,:email,:profile_image,:introduction,:phone_number1,:phone_number2,:phone_number3,:state,:city,:street,:zip,:twitter_id ,:facebook_id ,:instagram_id)
  end


end