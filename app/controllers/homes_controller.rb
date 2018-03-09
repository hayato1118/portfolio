class HomesController < ApplicationController
layout 'top.application'

	def index
		session[:contact] = nil
		@contact = Contact.new
	end

	# def confirm
 #      @contact = Contact.new(contact_params)
 #      session[:contact] = @contact
 #      session[:contact].save
 #      render :index if @contact.invalid?
 #  	end

	# def create
	# @contact = Contact.new(contact_params)
	# @contact.save
	# redirect_to root_path
	  # @contact = Contact.new(session[:contact])
	  # if params[:back]
	  # render :index
	  # elsif
	  # @contact.save
	  # redirect_to home_complete_path
	  # else
	  # render :index
	  # end
# end


	# private
	# 	def contact_params
	# 		params.require(:contact).permit(:message,:name,:nick_name,:email,:phone,:status)
	# 	end

end

