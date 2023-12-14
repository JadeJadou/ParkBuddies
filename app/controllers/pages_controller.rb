class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @parks = Park.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR address ILIKE :query"
      @parks = @parks.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @markers = @parks.geocoded.map do |park|
      {
        lat: park.latitude,
        lng: park.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { park: park }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
