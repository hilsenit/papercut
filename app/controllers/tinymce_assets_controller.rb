class TinymceAssetsController < ApplicationController
  before_action :authenticate_user!
  def create
      # Take upload from params[:file] and store it somehow...
      # Optionally also accept params[:hint] and consume if needed
    image = TextImage.create(params.permit(:alt, :hint, :file))

    render json: {
      image: {
        url: image.file.url
      }
    }, content_type: "text/html"
  end
end
