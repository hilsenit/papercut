class WorksController < ApplicationController
  URL = "https://www.papercutodyssey.dk"

  def index
    @theme = Theme.find(params[:theme_id])
    # Hvis det er et bestemt content, så tag det, ellers bare tag det første
    @works = @theme.works
    @current_work =
      params[:work_id] == "0" ? @works.first : Work.find(params[:work_id])

    agent = request.headers["HTTP_USER_AGENT"].downcase
    if agent.include?("facebook")
      render_facebook_share_info @current_work, params
      return
    end

    @sources = @theme.sources
    @to_dos = @theme.to_dos

    respond_to do |format|
      format.html
      format.json { render json: { works: @works, theme: @theme, sources: @sources, current_work: @current_work, to_dos: @to_dos } }
    end
  end


  def show_category
     case params[:work_category]
      when "laes"
        @works = Work.laes
        @headline = " Læs"
      when "hoer"
        @works = Work.hoer
        @headline = " Hør"
      else
        @works = Work.se
        @headline = " Se"
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
      if params[:commit] == "Gem kilder" # hvis man bare ønsker at gemme kilderne
        redirect_to edit_theme_work_path(@work.theme.id, @work.id, anchor: 'sources')
      else
        redirect_to ba_show_works_path(@work.theme.id), notice: return_messages("notice", "'#{@work.title}' er blevet oprettet")
      end
    else
      flash.now[:notice] = return_messages("alert", @work.errors.full_messages)
      @theme = Theme.find(@work.theme.id)
      render :new
    end
  end

  def update
    @work = Work.find(params[:id])
    if @work.update_attributes(work_params)
      if params[:commit] == "Gem kilder" # hvis man bare ønsker at gemme kilderne
        redirect_to edit_theme_work_path(@work.theme.id, @work.id, anchor: 'sources')
      else
        redirect_to show_theme_works_path(@work.theme.id, @work.id), notice: return_messages("notice", "'#{@work.title}' er opdateret")
      end
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

  def render_facebook_share_info work, params_passed
    @currentUrl = URL + "/themes/#{params_passed[:theme_id]}/works/#{params_passed[:work_id]}"
    @currentImage = work.share_image.present? ? work.share_image.url : work.cover_image.url #Hvis share image ikke er der, så tag cover
    @currentTitle = work.title #Work har altid en title!
    description = work.share_description.present? ? work.share_description : "" # Hvis der ikke er nogen skal den bare være tom
    @currentDescription = description
    render 'shared_facebook_data', layout: false # Uden gammel head meta data
  end

  private

  def work_params
    params.require(:work).permit(:title,
                                 :theme_id,
                                 :description,
                                 :short_description,
                                 :category,
                                 :type_of_content,
                                 :cover_image,
                                 :share_description,
                                 :share_image,
                                 :created_by,
                                 :youtube_url,
                                 :youtube_in_top,
                                 :youtube_in_bottom,
                                 :soundcloud_url,
                                 :soundcloud_in_top,
                                 :soundcloud_in_bottom,
                                 :photo_by,
                                 to_dos_attributes: [:id, :title, :link, :image, :description, :destroy],
                                 sources_attributes: [:id, :title, :link, :image, :description, :_destroy])
  end
end
