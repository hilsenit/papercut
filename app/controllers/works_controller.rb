class WorksController < ApplicationController

  def index

  end

  def show

  end

  def new
    @theme = Theme.find(params[:theme_id])
    @work = Work.new
  end

  def edit
    @theme = Theme.find(params[:theme_id])
    @work = Work.find(params[:id])
  end

  def create
    work = Work.new(work_params)
    if work.save
      flash[:notice] = "'#{work.title}' er blevet oprettet"
      redirect_to ba_show_works_path(work.theme.id)
    else
      flash.now[:alert] = "Content kunne desværre ikke gemmes. Prøv igen, eller skriv til kontakt@hilsen.it"
      render :new
    end
  end

  def update
    work = Work.find(params[:id])
    if work.update_attributes(work_params)
      flash[:notice] = "'#{work.title}' er opdateret"
      redirect_to ba_show_works_path(work.theme.id)
    else
      flash[:alert] = "'#{work.title}' kunne desværre ikke opdateres. Prøv igen. Eller kontakt kontakt@hilsen.it"
      redirect_to edit_theme_work_path(work.theme.id, work.id)
    end
  end

  def destroy
    work = Work.find(params[:id])
    if work.destroy
      flash[:notice] = "'#{work.title}' er blevet slettet"
      redirect_to backend_path()
    else
      flash[:alert] = "'#{work.title}' kunne desværre ikke slettes. Prøv igen. Hvis dette ikke virker, så skriv til kontakt@hilsen.it"
      redirect_to ba_show_works_path(work.theme.id)
    end
  end

  private
  def work_params
    params.require(:work).permit(:title, :description, :short_description, :category, :theme_id, :type)
  end
end
