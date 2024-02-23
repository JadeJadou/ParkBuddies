# lib/tasks/import_parks.rake
require 'httparty'

namespace :data do
  desc "Import parks data from OpenStreetMap using HTTParty"
  task import_parks: :environment do
    def fetch_osm_data
      query = '[out:json];(node["leisure"="park"](50.745,7.17,50.75,7.18););out;'
      response = HTTParty.post("https://overpass-api.de/api/interpreter", body: {data: query})
      JSON.parse(response.body)
    end

    osm_data = fetch_osm_data

    osm_data["elements"].each do |element|
      # Créez ou mettez à jour vos parcs ici en utilisant les données d'OSM
      # Exemple : Park.find_or_create_by(...)
      Park.find_or_create_by(
        name: element["tags"]["name"],
        latitude: element["lat"],
        longitude: element["lon"]) if element["tags"]["name"].present? && element["lat"].present? && element["lon"].present?
    end
  end
end
