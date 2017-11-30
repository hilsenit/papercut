class BackendController < ApplicationController

  def index
    @themes = Theme.all
  end

end
