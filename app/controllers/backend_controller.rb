class BackendController < ApplicationController
  before_action :authenticate_user!

  def index
    @themes = Theme.all
    unless Page.last.nil?
      @pages = Page.last if Page.exists?(Page.last.id)
    end
  end

  def show_theme_content
    @theme = Theme.find(params[:theme_id])
    @works = @theme.works
  end

end
