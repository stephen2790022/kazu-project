class ContactsController < ApplicationController
  require 'mail_form' 

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to root_path
    else
      flash.now[:error] = 'Nous ne pouvons pas envoyer votre message'
      redirect_to :new
    end
  end

end
