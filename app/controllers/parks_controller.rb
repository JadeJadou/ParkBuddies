class ParksController < ApplicationController
  def index
    @parks = Park.all.order(:id)

    if params[:query].present?
      searchable_columns = %w[name address category]
      conditions = searchable_columns.map { |col| "parks.#{col} ILIKE :query" }.join(' OR ')
      @parks = @parks.where(conditions, query: "%#{params[:query]}%")
      # sql_subquery = "name ILIKE :query OR address ILIKE :query"
      # @parks = @parks.where(sql_subquery, query: "%#{params[:query]}%")
    end

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
                lng: @park.longitude,
                info_window_html: render_to_string(partial: "info_window", locals: { park: @park })
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
