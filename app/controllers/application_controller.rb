class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private

  def return_messages type, *messages
    messages.flatten! # Error messages comes in arrays
    @messages = messages.map {|msg| {type.to_sym => msg} }
  end

end
