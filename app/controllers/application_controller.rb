class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    backend_path()
  end

  private

  def return_messages type, *messages
    messages.flatten! # Error messages comes in arrays
    @messages = messages.map {|msg| {type.to_sym => msg} }
  end

end
