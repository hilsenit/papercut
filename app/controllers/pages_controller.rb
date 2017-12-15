class PagesController < ApplicationController

  def new
    @pages = Page.new()
  end

  def edit
    @pages = Page.find(params[:id])
  end

  def create
    @pages = Page.new(pages_params)
    if @pages.save
      redirect_to backend_path()
    else
      render :new
    end
  end

  def update
    @pages = Page.find(params[:id])
    if @pages.update_attributes(pages_params)
      redirect_to backend_path()
    else
      render :edit
    end
  end

  def frontpage
    @theme = Theme.first # Newest
    load_newsline
  end

  def om
    @om_title = Pages.last.om_title
    @om_text = Pages.last.om_text
  end

  def bidrag
    @bidrag_l_title = Pages.last.bidrag_l_title
    @bidrag_left = Page.last.bidrag_left
    @bidrag_r_title = Pages.last.bidrag_r_title
    @bidrag_right = Page.last.bidrag_right
  end

  private

  def load_newsline
    @newsline = News.all
    params[:news_line] = @newsline.shuffle
  end

  def pages_params
    params.require(:page).permit(:om_text, :om_title, :bidrag_left, :bidrag_l_title, :bidrag_right, :bidrag_r_title)
  end

end

