class FlatsController < ApplicationController
  before_action :find_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.order('id DESC')
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def show; end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat)
          .permit(
            :name,
            :address,
            :description,
            :price_per_night,
            :number_of_guests
          )
  end
end
