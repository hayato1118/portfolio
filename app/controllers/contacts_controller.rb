class ContactsController < ApplicationController


	def confirm
      @contact = Contact.new(contact_params)
      session[:contact] = @contact
      session[:contact].save
      render :index if @contact.invalid?
  	end

	def create
	@contact = Contact.new(session[:contact])

	 @contact.id = nil
	 @contact.save
	 session[:contact] = nil
	  redirect_to contact_complete_path(@contact)
	
	end


	private
		def contact_params
			params.require(:contact).permit(:id,:message,:name,:nick_name,:email,:phone,:status)
		end

end
