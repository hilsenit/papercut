class TextImagesController < ApplicationController
  before_action :authenticate_user!
  def new
    @image = TextImage.build.params(image_params)
  end

  def show
    @image = TextImage.find(params[:id])
  end

  private

  def image_params
    params.require(:text_image).permit(:alt, :hint, :file)
  end

end
