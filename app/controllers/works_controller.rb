class WorksController < ApplicationController

  def index
    @theme = Theme.find(params[:theme_id])
    @works = @theme.works
  end

  def show_category
    @works = case params[:work_category]
      when "laes"; Work.laes
      when "hoer"; Work.hoer
      when "se"; Work.se
    end
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
    @work = Work.new(work_params)
    if @work.save
      redirect_to ba_show_works_path(@work.theme.id), notice: return_messages("notice", "'#{@work.title}' er blevet oprettet")
    else
      flash.now[:notice] = return_messages("alert", @work.errors.full_messages)
      @theme = Theme.find(@work.theme.id)
      render :new
    end
  end

  def update
    @work = Work.find(params[:id])
    if @work.update_attributes(work_params)
      redirect_to theme_works_path(@work.theme.id), notice: return_messages("notice", "'#{@work.title}' er opdateret")
    else
      flash.now[:notice] = return_messages("alert", @work.errors.full_messages)
      redirect_to edit_theme_work_path(@work.theme.id, @work.id)
    end
  end

  def destroy
    @work = Work.find(params[:id])
    if @work.destroy
      redirect_to backend_path(), notice: return_messages("notice", "'#{@work.title}' er blevet slettet")
    else
      redirect_to ba_show_works_path(@work.theme.id), notice: return_messages("alert", @work.errors.full_messages)
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :short_description, :category, :theme_id, :type_of_content, :cover_image, :created_by, :photo_by)
  end
end
