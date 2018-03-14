class SampleMailer < ApplicationMailer

  def send_when_update(user)
    @user = user
    mail to:      user.email,
         subject: '会員情報が更新されました。'
  end

  def send_when_order(order)
  	@order = order
  	@product_order = @order.product_orders
  	mail to:    @order.email,
  	# mail to:    current_user.order.email,
  		 subject: "購入完了のお知らせ。"
  end


  def send_when_contact(contact)
    @contact = contact
    mail to:    @contact.email,
       subject: "お問い合わせ完了しました。"
  end


end

