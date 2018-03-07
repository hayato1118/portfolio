class Admins::ContactsController < ApplicationController
before_action :authenticate_admin!
layout 'admin.application'


# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー

	def index
		@contacts = Contact.page(params[:page]).search(params[:search]).reverse_order
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def create
		# @contact = Contact.new(contact_params)
		# @contact.save
		# redirect_to root_path
	      @contact = Contact.new(session[:contact])
	      if params[:back]
	      render :index
	      elsif @contact.save
	      session[:contact] = nil
	      redirect_to contact_complete_path(@contact)
	      else
	      render :new
	      end
	end

	def update
		@contact = Contact.find(params[:id])
		@contact.update(contact_params)
		redirect_to admins_contacts_path
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to admins_contacts_path
	end



	private
		def contact_params
			params.require(:contact).permit(:message,:name,:contact_image,:nick_name,:email,:phone,:status)
		end

end


# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー
# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー# 管理者用コントローラー