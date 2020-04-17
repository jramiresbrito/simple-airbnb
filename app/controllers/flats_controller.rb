class FlatsController < ApplicationController
  def index
    @flats = Flat.order('id DESC')
  end
end
