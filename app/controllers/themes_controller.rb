class ThemesController < ApplicationController

  def index
    @themes = Theme.all
  end

  def show

  end

  def new
    @theme = Theme.new
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to backend_path(), notice: return_messages("notice", "Dit nye tema '#{@theme.title}' er blevet oprettet.")
    else
      flash.now[:notice] = return_messages("alert", @theme.errors.full_messages)
      render :new
    end
  end

  def update

  end

  def destroy

  end


  private

  def theme_params
    params.require(:theme).permit(:title, :description, :cover_image, :made_by)
  end
end
