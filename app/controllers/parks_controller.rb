class ParksController < ApplicationController
  def index
    @parks = Park.all
    # if params[:query].present?
    @markers = @parks.geocoded.map do |park|
      {
        lat: park.latitude,
        lng: park.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { park: park }),
      }
    end
  end

  def show
    @park = Park.find(params[:id])
    @favorite = Favorite.find_by(park: @park, user: current_user) || Favorite.new # cherche le fav si c'est déja liker et sinon crée un nouveau fav pour le bouton
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
