class Admins::UsersController < ApplicationController
layout 'admin.application'

# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー



	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@users = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to admins_users_path
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admins_users_path
	end


# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー
# 管理者用コントローラー

	private

		def user_params
			params.require(:user).permit(:last_name,:last_name_kana,:first_name,:first_name_kana,:nickname,:email,:profile_image,:introduction,:phone_number1,:phone_number2,:phone_number3,:state,:city,:street,:zip,:twitter_id ,:facebook_id ,:instagram_id)
		end
end