class ParksController < ApplicationController
  def index
    @parks = Park.all
    @markers = @parks.geocoded.map do |park|
      {
        lat: park.latitude,
        lng: park.longitude
      }
    end
  end

  def show
    @park = Park.find(params[:id])
    @marker = [{
      lat: @park.latitude,
      lng: @park.longitude
    }]
  end

  private

  def park_params
    params.require(:park).permit(:name, :description, :category, :sandbox, :slide, :sling, :photo)
  end
end

    # t.boolean "water"
    # t.boolean "climber"
    # t.boolean "coffee"
    # t.boolean "zoo"
    # t.boolean "toys_rent"
    # t.integer "suitable_from_age"
