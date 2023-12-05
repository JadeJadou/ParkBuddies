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

puts "Creating users"

#Lausanne
user1 = User.create!(first_name: "John", last_name: "Lenon",  nickname:"Zigoto", address:"Lausanne", kids_average_age:"3", kids_count:"2", email: "john@email.com", password: "123456", avatar:"")
user2 = User.create!(first_name: "Olivier",last_name: "Leroy", nickname:"OliveLsne", address:"Lausanne", kids_average_age:"7", kids_count:"3", email: "olivier@email.com", password: "azerty", avatar:"")
user3 = User.create!(first_name: "Marc",last_name: "Dupuis", nickname:"Ace3", address:"Lausanne", kids_average_age:"9", kids_count:"1", email: "user3@email.com", password: "azerty3", avatar:"")
user4 = User.create!(first_name: "Paul",last_name: "Dupont", nickname:"Ace4", address:"Lausanne", kids_average_age:"5", kids_count:"4", email: "user4@email.com", password: "azerty4", avatar:"")
#Geneve
user5 = User.create!(first_name: "Julie",last_name: "Desbois", nickname:"Ace5", address:"Geneve", kids_average_age:"3", kids_count:"3", email: "user5@email.com", password: "azerty5", avatar:"")
user6 = User.create!(first_name: "Marie",last_name: "Leclerc", nickname:"Ace6", address:"Geneve", kids_average_age:"5", kids_count:"2", email: "user6@email.com", password: "azerty6", avatar:"")
user7 = User.create!(first_name: "Pierre",last_name: "Lefevre", nickname:"Ace7", address:"Geneve", kids_average_age:"6", kids_count:"1", email: "user7@email.com", password: "azerty7", avatar:"")
#Montreux
user8 = User.create!(first_name: "Sophie",last_name: "Durand", nickname:"Ace8", address:"Montreux", kids_average_age:"2", kids_count:"1", email: "user8@email.com", password: "azerty8", avatar:"")
user9 = User.create!(first_name: "Lucas",last_name: "Roux", nickname:"Ace9", address:"Montreux", kids_average_age:"4", kids_count:"2", email: "user9@email.com", password: "azerty9", avatar:"")
user10 = User.create!(first_name: "Martin",last_name: "Moreau", nickname:"Ace10", address:"Monteux", kids_average_age:"8", kids_count:"4", email: "user10@email.com", password: "azerty10", avatar:"")

puts "Creating parks"

  #Lausanne

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

  #Geneve

park6 = Park.new(
  name: "Parc des Bastions",
  address: "Prom. des Bastions 1, 1205 Genève, Suisse",
  description: "La place de jeux du parc des Bastions est située au cœur d’un parc historique, dans le quartier de Plainpalais. Composée notamment d’un «mur à jouer», elle offre de nombreuses occasions de jeux entre les tourelles, les ponts de cordes et les cabanes agrémentées de miroirs, de bouliers et de puzzles.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809754/GE_Bastions_gnzqze.jpg")
park6.photo.attach(io: file, filename: "Parc des Bastions.jpg", content_type: "image/jpg")

park7 = Park.new(
  name: "Parc de la Grange",
  address: "Quai Gustave-Ador, 1207 Genève",
  description: "Le parc La Grange est le plus grand parc de la ville et l’un des plus beaux. Ses arbres majestueux, ses points de vue spectaculaires et ses ambiances variées en font un lieu de promenade privilégié. Il est situé entre le quartier des Eaux-Vives et le parc des Eaux-Vives avec lequel il forme une continuité spatiale et végétale.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809756/GE_Parc_Grange_x45rlp.jpg")
park7.photo.attach(io: file, filename: "Parc de la Grange.jpg", content_type: "image/jpg")

park8 = Park.new(
  name: "Parc des Eaux-Vives",
  address: "Quai Gustave-Ador 82, 1207 Genève, Suisse",
  description: "Situé dans la continuité du parc La Grange, le parc des Eaux-Vives bénéficie d’une situation extraordinaire, dominant le lac et le Jura. C’est un lieu impressionnant où beauté et nature se courtisent depuis presque 5 siècles.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809754/GE_Eaux-Vives_vwgtvz.jpg")
park8.photo.attach(io: file, filename: "Parc des Eaux-Vives.jpg", content_type: "image/jpg")

park9 = Park.new(
  name: "Parc de la Perle du Lac",
  address: "Rue de Lausanne 120B, 1202 Genève, Suisse",
  description: "Le parc de la Perle du Lac est un parc public situé dans le quartier des Eaux-Vives à Genève, en Suisse. Il est situé à l'emplacement de l'ancien domaine de la famille Lullin, dont il conserve quelques vestiges, notamment la villa de La Grange, ainsi que les jardins.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809756/GE_LaPerleduLac_alsvg3.jpg")
park9.photo.attach(io: file, filename: "Parc de la Perle du Lac.jpg", content_type: "image/jpg")

park10 = Park.new(
  name: "Parc des Franchises",
  address: "Av. de Châtelaine, 1203 Genève, Suisse",
  description: "Situé entre le quartier des Charmilles et celui de Vieusseux, ce grand et beau parc, riche d’arbres magnifiques, abrite l'un des plus grands biotopes humides du canton de Genève et offre une large palette d’activités récréatives et sportives. Il est très apprécié de la population environnante.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809754/GE_Franchises_jprnq8.jpg")
park10.photo.attach(io: file, filename: "Parc des Franchises.jpg", content_type: "image/jpg")

park11 = Park.new(
  name: "Parc des Cropettes",
  address: "Rue Elisabeth-Baulacre, 1202 Genève, Suisse",
  description: "Situé derrière la gare Cornavin, le parc des Cropettes permet de s’échapper dans la verdure au sortir de la gare. Poumon du quartier des Grottes, il est très fréquenté par la population et accueille de nombreuses manifestations.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809754/GE_Franchises_jprnq8.jpg")
park11.photo.attach(io: file, filename: "Parc des Cropettes.jpg", content_type: "image/jpg")

  #Montreux

park12 = Park.new(
  name: "Parc Vernex",
  address: "Avenue du Vernex 2, 1815 Clarens, Suisse",
  description: "Situé au bord du lac Léman et à côté de l'Auditorium Stravinsky, le parc Vernex offre aux promeneurs un espace de verdure dans la continuité des quais fleuris de Montreux Riviera. Chaque année au mois de juillet, il se transforme pour accueillir l'une des scènes du Montreux Jazz Festival. Parmi ses grands arbres centenaires et son magnolia majestueux, le Parc Vernex héberge diverses œuvres d'art, dont la fontaine à la mémoire de Vibeke de Jean Flemming Soerensen et la scuplture Montrailes d'Antoine Poncet. A son extrémité, les bustes de Richard Strauss et de Miles Davis, sculptés par Bernard Bavaud, se font face et rappellent aux visiteurs le riche passé de Montreux Riviera. De l'autre côté, la place de jeux et la pelouse en pente légère font du Parc Vernex un espace privilégié pour les familles et les promeneurs en quête de repos.",
  category: "Moyen",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

  #WEBP?
file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809871/MTX_Vernex_zwq7cl.webp")
park12.photo.attach(io: file, filename: "Parc Vernex.jpg", content_type: "image/jpg")

park13 = Park.new(
  name: "Parc de la Rouvenaz",
  address: "Avenue du Casino 32, 1820 Montreux, Suisse",
  description: "Le parc de la Rouvenaz est un parc public de 1,5 hectare situé à Montreux, en Suisse. Il est situé à proximité du lac Léman et du centre-ville de Montreux. Il est traversé par la rivière de la Baye de Montreux, qui lui a donné son nom.",
  category: "Petit",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809757/MTX_Rouvenaz_silsbp.jpg")
park13.photo.attach(io: file, filename: "Parc de la Rouvenaz.jpg", content_type: "image/jpg")

park14 = Park.new(
  name: "Le Parc Donner",
  address: "Avenue de Chillon 47, 1820 Montreux, Suisse",
  description: "Le Parc Donner, à l’est de Montreux, sert depuis 1947 de place de jeux pour les enfants. Il a été réaménagé de façon à abriter un parking semi-enterré tout en conservant en surface sa vocation d’espace dédié aux enfants.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809755/MTX_DONNER_vobqbd.jpg")
park14.photo.attach(io: file, filename: "Parc Donner.jpg", content_type: "image/jpg")

  #Nyon

park15 = Park.new(
  name: "Parc de Mangettes",
  address: "Chemin de Mangette, 1260 Nyon, Suisse",
  description: "Véritable poumon vert, ce parc offre une vaste étendue pour se détendre, pique-niquer et s'amuser au milieu d'arbres remarquables fonctionnant comme un îlot de fraîcheur. Les vestiges de l'aqueduc romain sont visibles sur quelques mètres. Une plate-bande de plantes vivaces agrémente le parc de ses fleurs colorées, parmi lesquelles des anémones du Japon qui fleurissent jusqu'aux premières gelées.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: false,
  climber: true,
  coffee: false,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809755/NYO_Mangettes_buep3k.jpg")
park15.photo.attach(io: file, filename: "Parc de Mangettes.jpg", content_type: "image/jpg")

park16 = Park.new(
  name: "Parc du Boiron",
  address: "Route de Genève 9, 1260 Nyon, Suisse",
  description: "Partez à la découverte d'un des lieux les plus riches en biodiversité de Nyon. Détendez-vous au bord de la rivière du Boiron et flânez dans un cadre naturel et calme. En saison, cet espace devient un haut lieu des grillades du week-end.",
  category: "Grand",
  sandbox: false,
  slide: false,
  sling: false,
  water: true,
  climber: true,
  coffee: false,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701781953/Parc_de_Milan_gcngdu.jpg")
park16.photo.attach(io: file, filename: "Parc du Boiron.jpg", content_type: "image/jpg")

park17 = Park.new(
  name: "Parc de Bois-Fleuri",
  address: "Pl. de Savoie 2, 1260 Nyon, Suisse",
  description: "Dans ce cadre idyllique, profitez de l'étendue verte offrant une vue imprenable sur le lac tout en laissant les enfants partir à l'aventure en jouant aux navigateurs. Vous apercevrez des arbres ancestraux ainsi qu'un sous-bois composé de rhododendrons et de taxus.",
  category: "Moyen",
  sandbox: true,
  slide: true,
  sling: true,
  water: false,
  climber: true,
  coffee: false,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809755/NYO_BoisFleuri_tktmhl.jpg")
park17.photo.attach(io: file, filename: "Parc de Bois-Fleuri.jpg", content_type: "image/jpg")

park18 = Park.new(
  name: "Parc de la Morâche",
  address: "Rue du Ronzier 9, 1260 Nyon, Suisse",
  description: "D'une surface de 12'000 m2, le parc de la Morâche a été inauguré en 2018. Lieu polyvalent destiné à la détente, aux rencontres et aux loisirs, ce modèle de biodiversité urbaine est un trait d'union entre les quartiers nord et sud de la ville. Les promeneurs découvriront sur place, l'oeuvre d'art Les Ailes du Cossy d'Emilie Ding.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: false,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809755/NYO_Morache_fsmgpk.jpg")
park18.photo.attach(io: file, filename: "Parc de la Morâche.jpg", content_type: "image/jpg")

  #Signal-de-Bougy

park19 = Park.new(
  name: "Parc de Signal-de-Bougy",
  address: " Rte du Signal, 1172 Bougy-Villars, Suisse",
  description: "Le parc de Signal-de-Bougy est un parc public de 50 hectares situé à Bougy-Villars, en Suisse. Il est situé sur le flanc sud du Jura, à une altitude de 700 mètres, surplombant le lac Léman et les Alpes. Il est situé à proximité de la sortie de l'autoroute A1 de Rolle.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: true,
  toys_rent: true,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809754/SGY-SIgnal_kusegk.jpg")
park19.photo.attach(io: file, filename: "Parc de Signal-de-Bougy.jpg", content_type: "image/jpg")

  #Aubonne

park20 = Park.new(
  name: "Place de jeux du Chêne",
  address: "Avenue du Chêne, 1170 Aubonne, Suisse",
  description: "Petite aire de jeux en plein coeur du village, très agréable.",
  category: "Petit",
  sandbox: true,
  slide: true,
  sling: true,
  water: false,
  climber: true,
  coffee: false,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809754/ABE_aubonne_cpelyv.jpg")
park20.photo.attach(io: file, filename: "Place de jeux du Chêne.jpg", content_type: "image/jpg")

  #Morges

park21 = Park.new(
  name: "Parc de l'Indépendance",
  address: "Avenue de l'Indépendance 1, 1110 Morges, Suisse",
  description: "Le Parc de l'indépendance se situe au bord du lac Léman, entre le château de Morges et la Morges. De nombreuses manifestations y sont organisées tout au long de l'année. Il est également possible de louer des barques et des pédalos pour profiter du lac.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: true,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809756/MGE_Independance_byfjx6.jpg")
park21.photo.attach(io: file, filename: "Parc de l'Indépendance.jpg", content_type: "image/jpg")

park22 = Park.new(
  name: "Parc de Vertou",
  address: "1110 Morges, Suisse",
  description: "Au sud-est de la Ville, le Parc de Vertou mélange des infrastructures sportives dans un lieu paisible au bord du lac.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701809755/MGE_Vertou_wwor07.jpg")
park22.photo.attach(io: file, filename: "Parc de Vertou.jpg", content_type: "image/jpg")


  puts "Saving parks"

park1.save
park2.save
park3.save
park4.save
park5.save
park6.save
park7.save
park8.save
park9.save
park10.save
park11.save
park12.save
park13.save
park14.save
park15.save
park16.save
park17.save
park18.save
park19.save
park20.save
park21.save
park22.save

  puts "Creating chatrooms"

chatroom1 = Chatroom.new(name: "Parc de Milan", park_id: park1.id)
chatroom2 = Chatroom.new(name: "Parc de Mon Repos", park_id: park2.id)
chatroom3 = Chatroom.new(name: "Parc de Rhodanie", park_id: park3.id)
chatroom4 = Chatroom.new(name: "Parc de Sauvabelin", park_id: park4.id)
chatroom5 = Chatroom.new(name: "Parc de Chandieu", park_id: park5.id)
chatroom6 = Chatroom.new(name: "Parc des Bastions", park_id: park6.id)
chatroom7 = Chatroom.new(name: "Parc de la Grange", park_id: park7.id)
chatroom8 = Chatroom.new(name: "Parc des Eaux-Vives", park_id: park8.id)
chatroom9 = Chatroom.new(name: "Parc de la Perle du Lac", park_id: park9.id)
chatroom10 = Chatroom.new(name: "Parc des Franchises", park_id: park10.id)
chatroom11 = Chatroom.new(name: "Parc des Cropettes", park_id: park11.id)
chatroom12 = Chatroom.new(name: "Parc Vernex", park_id: park12.id)
chatroom13 = Chatroom.new(name: "Parc de la Rouvenaz", park_id: park13.id)
chatroom14 = Chatroom.new(name: "Le Parc Donner", park_id: park14.id)
chatroom15 = Chatroom.new(name: "Parc de Mangettes", park_id: park15.id)
chatroom16 = Chatroom.new(name: "Parc du Boiron", park_id: park16.id)
chatroom17 = Chatroom.new(name: "Parc de Bois-Fleuri", park_id: park17.id)
chatroom18 = Chatroom.new(name: "Parc de la Morâche", park_id: park18.id)
chatroom19 = Chatroom.new(name: "Parc de Signal-de-Bougy", park_id: park19.id)
chatroom20 = Chatroom.new(name: "Place de jeux du Chêne", park_id: park20.id)
chatroom21 = Chatroom.new(name: "Parc de l'Indépendance", park_id: park21.id)
chatroom22 = Chatroom.new(name: "Parc de Vertou", park_id: park22.id)

  puts "Saving chatrooms"

chatroom1.save
chatroom2.save
chatroom3.save
chatroom4.save
chatroom5.save
chatroom6.save
chatroom7.save
chatroom8.save
chatroom9.save
chatroom10.save
chatroom11.save
chatroom12.save
chatroom13.save
chatroom14.save
chatroom15.save
chatroom16.save
chatroom17.save
chatroom18.save
chatroom19.save
chatroom20.save
chatroom21.save
chatroom22.save
