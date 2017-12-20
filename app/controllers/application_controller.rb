class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    backend_path()
  end

  def accept_cookies
    cookies[:accepted_cookies] = { value: true, expires: 30.days.from_now }
    byebug
  end

  private

  def return_messages type, *messages
    messages.flatten! # Error messages comes in arrays
    @messages = messages.map {|msg| {type.to_sym => msg} }
  end

end
