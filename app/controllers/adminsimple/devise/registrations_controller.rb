class Adminsimple::Devise::RegistrationsController < Devise::RegistrationsController

  #skip_authorization_check

  layout :layout

  before_action :authenticate!

  private

  def authenticate!
    self.send("authenticate_#{Adminsimple.configuration.devise_model}!")
  end

  def layout
    'adminsimple/application'
  end

  def self.mimes_for_respond_to
    {html: {}}
  end

end
