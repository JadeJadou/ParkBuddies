namespace :osm_import do
  desc "Import playgrounds from OpenStreetMap"
  task import_playgrounds: :environment do
    require 'httparty'

    url = 'https://overpass-api.de/api/interpreter'
    query = '[out:json];area[name="France"];(node["leisure"="playground"](area);way["leisure"="playground"](area);rel["leisure"="playground"](area););out center;'
    response = HTTParty.post(url, body: { data: query }, timeout: 120)

    if response.success?
      JSON.parse(response.body)['elements'].each do |element|
        Park.find_or_create_by(osm_id: element['id']) do |park|
          park.name = element['tags']['name'] || 'Unknown Park/Playground'
          park.latitude = element['lat']
          park.longitude = element['lon']
          # autres attributs si nécessaire
        end
      end
    else
      puts "Erreur lors de l'importation des données"
    end
  end
end
