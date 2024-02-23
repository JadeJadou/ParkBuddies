class ParksController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    if @park.save
      redirect_to @park, notice: 'Merci! Le parc a été créé avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
      redirect_to @park, notice: 'Merci! Les informations du parc ont été mises à jour!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

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
        #marker_html: render_to_string(partial: "marker") #pour afficher le logo comme marker
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

  def fetch
    ne_lat, ne_lon, sw_lat, sw_lon = params.values_at(:ne_lat, :ne_lon, :sw_lat, :sw_lon)
    overpass_url = "http://overpass-api.de/api/interpreter"
    query = "[out:json];(node['leisure'='park'](#{sw_lat},#{sw_lon},#{ne_lat},#{ne_lon});way['leisure'='park'](#{sw_lat},#{sw_lon},#{ne_lat},#{ne_lon});rel['leisure'='park'](#{sw_lat},#{sw_lon},#{ne_lat},#{ne_lon}););out body;>;out skel qt;"

    uri = URI.parse(overpass_url)
    http_response = Net::HTTP.post_form(uri, 'data' => query)

    if http_response.is_a?(Net::HTTPSuccess)
      render json: http_response.body.force_encoding('UTF-8')
    else
      render json: { error: 'API Overpass response was not successful' }, status: :bad_request
    end
  rescue => e
    render json: { error: e.message }, status: :bad_request
  end


  private

  def park_params
    params.require(:park).permit(:name, :description, :category, :sandbox, :slide, :sling, :water, :climber, :coffee, :zoo, :toys_rent, :dogs, :barbecue, :shade, :benches, :tables, :trash, :toilets, :picnic, :parking, :bike, :skateboard, :basketball, :football, :tennis, :volleyball, :badminton, :pingpong, :golf, :running, :cycling, :roller, :hiking, :fishing, :horse_riding, :bird_watching, :swimming, :forest, :lake, :river, :sea, :mountain, :photo)
  end

end

    # t.boolean "water"
    # t.boolean "climber"
    # t.boolean "coffee"
    # t.boolean "zoo"
    # t.boolean "toys_rent"
    # t.integer "suitable_from_age"
