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
end
