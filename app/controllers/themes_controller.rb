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
    @theme = Theme.find(params[:id])
    if @theme.update_attributes(theme_params)
      redirect_to backend_path(), notice: return_messages("notice", "Dit tema '#{@theme.title}' er blevet opdateret.")
    else
      flash.now[:notice] = return_messages("alert", @theme.errors.full_messages)
      render :edit
    end
  end

  def destroy
    @theme = Theme.find(params[:id])
    if @theme.destroy
      redirect_to backend_path(),
        notice: return_messages("notice", "Dit tema '#{@theme.title}' er blevet slettet. Sammen med #{@theme.works.size} stk. content.")
    else
      redirect_to backend_path(),
        notice: return_messages("alert", "Det var ikke muligt at slette dit tema. Prøv igen eller tag kontakt til kontakt@hilsen.it")
    end
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :description, :cover_image, :made_by)
  end
end
