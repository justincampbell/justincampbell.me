class TilController < ApplicationController
  def index
    @things = Til.all
  end

  def show
    @thing = Til.find_by_slug params[:slug]
  end

  def new
    @thing = Til.new
  end

  def create
    @thing = Til.create params[:til]

    redirect_to til_show_path(@thing)
  end

  def preview
    @thing = Til.new params[:til]

    render partial: 'thing', locals: { thing: @thing }
  end
end
