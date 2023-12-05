# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

User.destroy_all
Chatroom.destroy_all
Park.destroy_all

puts "Creating user"
user1 = User.create!(first_name: "John", last_name: "Lenon",  nickname:"Zigoto", address:"Lausanne", kids_average_age:"3", kids_count:"2", email: "john@email.com", password: "123456", avatar:"")
user2 = User.create!(first_name: "Olivier",last_name: "Leroy", nickname:"Ace", address:"Lausanne", kids_average_age:"3", kids_count:"3", email: "olivier@email.com", password: "azerty", avatar:"")
user3 = User.create!(first_name: "Marc",last_name: "Dupuis", nickname:"Ace3", address:"Lausanne", kids_average_age:"3", kids_count:"1", email: "user3@email.com", password: "azerty", avatar:"")
user4 = User.create!(first_name: "Paul",last_name: "Dupont", nickname:"Ace4", address:"Lausanne", kids_average_age:"3", kids_count:"4", email: "user4@email.com", password: "azerty", avatar:"")
user5 = User.create!(first_name: "Julie",last_name: "Desbois", nickname:"Ace5", address:"Lausanne", kids_average_age:"3", kids_count:"3", email: "user5@email.com", password: "azerty", avatar:"")
user6 = User.create!(first_name: "Marie",last_name: "Leclerc", nickname:"Ace6", address:"Lausanne", kids_average_age:"3", kids_count:"2", email: "user6@email.com", password: "azerty", avatar:"")
user7 = User.create!(first_name: "Pierre",last_name: "Lefevre", nickname:"Ace7", address:"Lausanne", kids_average_age:"3", kids_count:"1", email: "user7@email.com", password: "azerty", avatar:"")
user8 = User.create!(first_name: "Sophie",last_name: "Durand", nickname:"Ace8", address:"Lausanne", kids_average_age:"3", kids_count:"5", email: "user8@email.com", password: "azerty", avatar:"")
user9 = User.create!(first_name: "Lucas",last_name: "Roux", nickname:"Ace9", address:"Lausanne", kids_average_age:"3", kids_count:"1", email: "user9@email.com", password: "azerty", avatar:"")
user10 = User.create!(first_name: "Martin",last_name: "Moreau", nickname:"Ace10", address:"Lausanne", kids_average_age:"3", kids_count:"3", email: "user10@email.com", password: "azerty", avatar:"")

puts "Creating park"
park1 = Park.new(
  name: "Parc de Milan",
  address: "Pl. de Milan, 1007 Lausanne, Suisse",
  description: "Il est sans doute difficile de trouver un enfant lausannois qui ne connaisse pas la place de Milan et son exceptionnelle place de jeux. Mais impossible de limiter ce parc à son seul aspect ludique. La place de Milan et le crêt de Montriond sont aussi des témoins de l’histoire lausannoise.",
  category: "Grand",
  sandbox: false,
  slide: true,
  sling: false,
  water: true,
  climber: false,
  coffee: true,
  zoo: true,
  toys_rent: true,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701781953/Parc_de_Milan_gcngdu.jpg")
park1.photo.attach(io: file, filename: "Parc de Milan.jpg", content_type: "image/jpg")

park2 = Park.new(
  name: "Parc de Mon Repos",
  address: "Av. Mon-Repos, 1005 Lausanne, Suisse",
  description: "De tous les beaux parcs qui constituent le patrimoine végétal historique lausannois, Mon-Repos est sans doute le plus extraordinaire: exceptionnel par la diversité de ses éléments architecturaux (tour néogothique, cascade, temple néoclassique, orangerie, volières, etc.), il l'est aussi par la richesse de la documentation en notre possession et par l'harmonie de l'ensemble.",
  category: "Petit",
  sandbox: false,
  slide: true,
  sling: false,
  water: true,
  climber: true,
  coffee: false,
  zoo: true,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701786505/2_Parc_de_Mon_Repos_ef29hn.jpg")
park2.photo.attach(io: file, filename: "Parc de Mon Repos.jpg", content_type: "image/jpg")

park3 = Park.new(
  name: "Parc de Rhodanie",
  address: "1007 Lausanne, Suisse",
  description: "À l’écart de la circulation, protégée de l’avenue de Rhodanie par une lisière d’arbre, cette petite place se trouve dans le Parc de la Campagne Rhoner. Elle dispose de jeux en bois pour les petits, sur un revêtement synthétique.",
  category: "Moyen",
  sandbox: false,
  slide: true,
  sling: true,
  water: false,
  climber: true,
  coffee: false,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701787369/3_Parc_de_Rhodanie_v9h6f7.jpg")
park3.photo.attach(io: file, filename: "Parc de Rhodanie.jpg", content_type: "image/jpg")

park4 = Park.new(
  name: "Parc de Sauvabelin",
  address: "Chemin de la Chocolatière, 1018 Lausanne, Suisse",
  description: "C'est encore la ville, c'est déjà la campagne: de la Tour et du Signal de Sauvabelin, un superbe panorama s'offre à la vue du promeneur. Au-dessus, des forêts de chênes entourent le lac de Sauvabelin, au charme duquel s'ajoute l'attrait de son parc animalier ProSpecieRara. Chèvres, cochons laineux, canards, sangliers et plusieurs autres volatiles sont à observer, en liberté ou dans des enclos.
  Le Parc de Sauvabelin abrite également «La Pinte du Lac» qui propose une cuisine locale et régionale, ainsi que des mets au fromage.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: false,
  climber: true,
  coffee: true,
  zoo: true,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701788229/4_Parc_de_Sauvabelin_i2eerv.jpg")
park4.photo.attach(io: file, filename: "Parc de Sauvabelin.jpg", content_type: "image/jpg")

park5 = Park.new(
  name: "Parc de Chandieu",
  address: "1006 Lausanne, Suisse",
  description: "Intégrée dans le préau du Collège de Chandieu et adossée à un talus boisé, cette place, reconnaissable à son sol en relief zébré de lignes blanches, offre de belles possibilités de course et de parcours en trottinette; elle comprend un trampoline intégré au sol, des balançoires, dont une balançoire-panier, des maisonnettes en bois installées dans une zone verte, une structure d’équilibre en bois et métal et un grand bac à sable avec jeux d’eau.

  Des arbres et des arbustes d’essences indigènes, plantés par les élèves, agrémentent le lieu. Bancs et tables de pique-nique font de cette place un agréable lieu de rencontre.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: false,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701790605/5_Parc_de_Chandieu_n2d718.jpg")
park5.photo.attach(io: file, filename: "Parc de Chandieu.jpg", content_type: "image/jpg")

puts "Sauvegarde les parcs"
park1.save
park2.save
park3.save
park4.save
park5.save

puts "Creating chatroom"

chatroom1 = Chatroom.new(name: "Parc de Milan", park_id: park1.id)
chatroom2 = Chatroom.new(name: "Parc de Mon Repos", park_id: park2.id)
chatroom3 = Chatroom.new(name: "Parc de Rhodanie", park_id: park3.id)
chatroom4 = Chatroom.new(name: "Parc de Sauvabelin", park_id: park4.id)
chatroom5 = Chatroom.new(name: "Parc de Chandieu", park_id: park5.id)

chatroom1.save
chatroom2.save
chatroom3.save
chatroom4.save
chatroom5.save
