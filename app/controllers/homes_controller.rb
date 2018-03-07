class HomesController < ApplicationController

	def index
		@contact = Contact.new
	end

	 def confirm
      @contact = Contact.new(contact_params)
      @contact.contact_image_id = @contact.contact_image.id
      session[:contact] = @contact
      session[:contact].save
      render :index if @contact.invalid?
  	end

	private
	def contact_params
		params.require(:contact).permit(:message,:name,:contact_image,:nick_name,:email,:phone,:status)
	end

end

