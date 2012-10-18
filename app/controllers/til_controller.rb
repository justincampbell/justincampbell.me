class TilController < ApplicationController
  def index
    @things = Til.all
  end

  def show
    @thing = Til.find_by_slug params[:id]
  end
end
