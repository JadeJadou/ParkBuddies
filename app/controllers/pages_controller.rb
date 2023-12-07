class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @parks = Park.all
    @markers = @parks.geocoded.map do |park|
      {
        lat: park.latitude,
        lng: park.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { park: park })
      }
    end
  end
end
