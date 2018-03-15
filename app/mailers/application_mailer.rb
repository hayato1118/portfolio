class ApplicationMailer < ActionMailer::Base
  # default from: 'from@example.com'
  # layout 'mailer'

	default from:     "from@example.com",
			bcc:      "code.cellars.seller@gmail.com",
			# reply_to: "code.cellars.seller@gmail.com"
          	reply_to: "code_cellars_reply@gmail.com"
	layout 'mailer'
end
