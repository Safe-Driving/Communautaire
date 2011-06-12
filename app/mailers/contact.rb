class Contact < ActionMailer::Base
  default :from => "from@example.com"

  def contact_email(email_params)
    render :layout => 'email'
    # You only need to customize @recipients.
    @recipients = email_params[:email]
    @from = email_params[:nom] + " <" + email_params[:email] + ">"
    @subject = email_params[:sujet]
    @sent_on = Time.now
    @body["email_body"] = email_params[:message]
    @body["email_name"] = email_params[:nom]
    content_type "text/html"
  end
end
