class PagesController < ApplicationController
  def burritos
    @burritos = Foursquare.burritos
  end
end
