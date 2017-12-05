class PagesController < ApplicationController



  def frontpage
    @theme = Theme.first
    load_newsline
  end

  def om
  end

  def bidrag
  end

  private

  def load_newsline
    @newsline = News.all
    params[:news_line] = @newsline
  end

end

