class NewsController < ApplicationController
  def new
    @news = News.new
    @works = Work.all
  end

  def edit
    @news = News.find(params[:id])
  end

  def index
    @news = News.all
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to news_index_path(), notice: return_messages("notice", "Din nyhed er blevet gemt")
    else
      @works = Work.all
      flash.now[:notice] = "Din nyhed blev desværre ikke gemt. Prøv igen. "
      render :new
    end
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes
      redirect_to news_index_path(), notice: return_messages("notice", "Din nyhed er blevet opdateret")
    else
      @works = Work.all
      flash.now[:notice] = "Din nyhed blev desværre ikke opdateret. Prøv igen. "
      render :edit
    end
  end
  private
  def news_params
    params.require(:news).permit(:title, :type_of_thing, :date, :work_id)
  end
end
