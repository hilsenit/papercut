class ThemesController < ApplicationController

  def index

  end

  def show

  end

  def new

  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update

  end

  def destroy

  end

  def show_theme_content
    tema = Theme.find(params[:theme_id])
    @works = tema.works
    if @works.empty?
      flash[:notice] = "Temaet har ikke noget content endnu. Opret nogle, før du kan fortsætte."
      redirect_to backend_path()
    end
  end

  def laes
    # All works with 'læs' as category
  end

  def se
    # All works with 'se' as category
  end

  def hoer
    # All works with 'hør' as  category
  end
end
