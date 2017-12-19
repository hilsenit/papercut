class NewsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
    @news = News.new
    @works = Work.all
  end

  def edit
    @news = News.find(params[:id])
    @works = Work.all
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
      flash.now[:notice] = return_messages("alert", @news.errors.full_messages)
      render :new
    end
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(news_params)
      redirect_to news_index_path(), notice: return_messages("notice", "Din nyhed er blevet opdateret")
    else
      @works = Work.all
      flash.now[:notice] = "Din nyhed blev desværre ikke opdateret. Prøv igen. "
      render :edit
    end
  end

  def destroy
    @news = News.find(params[:id])
    if @news.destroy
      redirect_to news_index_path(), notice: return_messages("notice", "Din nyhed '#{@news.title}' er nu blevet slettet.")
    else
      redirect_to news_index_path(), notice: return_messages("alert", "Din nyhed kunne desværre ikke fjernes. Kontakt hilsen.it på kontakt@hilsen.it")
    end
  end

  private

  def news_params
    params.require(:news).permit(:title, :type_of_thing, :date, :work_id)
  end
end
