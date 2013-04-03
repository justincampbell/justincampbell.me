class TilController < ApplicationController
  before_filter :ensure_signed_in, except: [:index, :show]

  def index
    @things = Til.order("created_at desc").page(params[:page]).per(5)

    respond_to do |format|
      format.html
      format.atom { render layout: false }
    end
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

  def update
    @thing = Til.find_by_slug params[:slug]
    @thing.update_attributes params[:til]

    redirect_to til_show_path(@thing)
  end

  def edit
    @thing = Til.find_by_slug params[:slug]
  end
end
