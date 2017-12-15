class PagesController < ApplicationController

  def new
    @pages = Page.new()
  end

  def edit
    @pages = Page.find(params[:id])
    if @pages.save(pages_params)

    else

    end
  end

  def create

  end

  def update

  end

  def frontpage
    @theme = Theme.first # Newest
    load_newsline
  end

  def om

  end

  def bidrag

  end

  private

  def load_newsline
    @newsline = News.all
    params[:news_line] = @newsline.shuffle
  end

  def pages_params
    params.require(:pages).permit(:om_text, :om_title, :bidrag_left, :bidrag_l_title, :bidrag_right, :bidrag_r_title)
  end

end

