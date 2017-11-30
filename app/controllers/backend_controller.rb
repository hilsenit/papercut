class BackendController < ApplicationController

  def index
    @themes = Theme.all
  end

  def show_theme_content
    tema = Theme.find(params[:theme_id])
    @works = tema.works
    if @works.empty?
      flash[:alert] = "Temaet har ikke noget content endnu. Opret noget, og prøv igen"
      redirect_to backend_path()
    end
  end

end
