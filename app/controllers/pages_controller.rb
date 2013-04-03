class PagesController < ApplicationController
  def burritos
    @burritos = Foursquare.burritos
    render 'pages/burritos', layout: nil
  end
end
