class ContentController < ApplicationController

  def auto
  end

  def moto
  end

  def contact

  end


  def send_mail
    Contact::deliver_contact_email(params[:email])
    redirect_to :root
  end

end
