class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:last_name_kana,:first_name,:first_name_kana,:nickname,:email,:profile_image,:introduction,:phone_number1,:phone_number2,:phone_number3,:github_id,:google_drive_id,:state,:city,:street,:zip)
  end

  def product_params
          params.require(:product).permit.permit(:user_id, :price, :image, :title, :url, :product_detail,
            categories_attributes: [:id, :product_id, :category_name, :_destroy]
          )
  end

end