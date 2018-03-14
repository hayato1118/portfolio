class ContactsController < ApplicationController


	def confirm
      @contact = Contact.new(contact_params)
      session[:contact] = @contact
      session[:contact].save
      redirect_to homes_path if @contact.invalid?
  	end

	def create
	@contact = Contact.new(session[:contact])

	 @contact.id = nil
	 @contact.save
	  SampleMailer.send_when_contact(@contact).deliver
	 session[:contact] = nil
	 redirect_to contact_complete_path(@contact)
	end


	private
		def contact_params
			params.require(:contact).permit(:message,:name,:nick_name,:email,:phone,:status)
		end

end
