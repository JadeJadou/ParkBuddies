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

Message.destroy_all
Favorite.destroy_all
PrivateMessage.destroy_all
PrivateChatroom.destroy_all
User.destroy_all
Chatroom.destroy_all
Park.destroy_all

puts "Creating users"

#Lausanne
user1 = User.create!(first_name: "John", last_name: "Lenon",  nickname:"Zigoto", address:"Lausanne", kids_average_age:"3", kids_count:"2", email: "john@email.com", password: "123456", avatar:"AV_chicken_black_green.png", description: "Je suis un père qui adore emmener mes deux enfants au parc. Nous passons des moments incroyables ensemble, mais je trouve ça un peu dommage de ne pas avoir l’occasion de rencontrer d’autres parents avec qui partager ces instants.")
user2 = User.create!(first_name: "Olivier",last_name: "Leroy", nickname:"OliveLsne", address:"Lausanne", kids_average_age:"7", kids_count:"3", email: "olivier@email.com", password: "azerty", avatar:"AV_fish_purple.png", description: "Je m’appelle OliveLsne, et chaque sortie au parc avec mes deux enfants est un moment de bonheur. Cependant, je ressens une pointe de regret de ne pas pouvoir échanger avec d’autres parents lors de ces moments précieux.")
user3 = User.create!(first_name: "Marc",last_name: "Dupuis", nickname:"DMArc", address:"Lausanne", kids_average_age:"9", kids_count:"1", email: "user3@email.com", password: "azerty3", avatar:"AV_sheep_yellow.png", description: "Je suis DMArc, et chaque visite au parc avec mes deux enfants est un pur plaisir. Nous jouons et rions ensemble, mais j’avoue que j’aimerais parfois pouvoir discuter avec d’autres parents pendant que les enfants s’amusent.")
user4 = User.create!(first_name: "Paul",last_name: "Dupont", nickname:"Paul-Nord", address:"Lausanne", kids_average_age:"5", kids_count:"4", email: "user4@email.com", password: "azerty4", avatar:"AV_sloth_black.png", description: "Je m’appelle Paul-Nord, et j’adore emmener mes deux enfants au parc pour profiter de la nature et des jeux. J’aimerais aussi saisir l’occasion de rencontrer d’autres parents, pour échanger des expériences et créer des liens d’amitié.")
#Geneve
user5 = User.create!(first_name: "Julie",last_name: "Desbois", nickname:"JusdeFruits", address:"Geneve", kids_average_age:"3", kids_count:"3", email: "user5@email.com", password: "azerty5", avatar:"AV_frog_green.png", description: "Je m’appelle JusdeFruits, et je chéris les moments passés au parc avec mes deux enfants. C’est toujours une aventure, mais parfois, je souhaite qu’il y ait plus d’opportunités pour moi de rencontrer et de se lier d’amitié avec d’autres parents.")
user6 = User.create!(first_name: "Marie",last_name: "Leclerc", nickname:"Marigold", address:"Geneve", kids_average_age:"5", kids_count:"2", email: "user6@email.com", password: "azerty6", avatar:"AV_kangaroo_black_coral.png", description: "Je m’appelle Marigold, et je trouve que les sorties au parc avec mes deux enfants sont des instants magiques. J’aspire à rencontrer d’autres parents lors de ces escapades, pour partager des conseils, des histoires et enrichir notre expérience familiale.")
user7 = User.create!(first_name: "Pierre",last_name: "Lefevre", nickname:"Piercing", address:"Geneve", kids_average_age:"6", kids_count:"1", email: "user7@email.com", password: "azerty7", avatar:"AV_pinguin_black.png", description: "J'aimerais apprécier le temps passé au parc autant que mes enfants.")
#Montreux
user8 = User.create!(first_name: "Sophie",last_name: "Durand", nickname:"Sophora", address:"Montreux", kids_average_age:"2", kids_count:"1", email: "user8@email.com", password: "azerty8", avatar:"AV_toucan_green.png", description: "J'adore discuter avec d'autres parents, mais je ne sais pas comment m'y prendre...cela pourrait être plus facile si je pouvais les rencontrer au parc!")
user9 = User.create!(first_name: "Lucas",last_name: "Roux", nickname:"Lucid", address:"Montreux", kids_average_age:"4", kids_count:"2", email: "user9@email.com", password: "azerty9", avatar:"AV_frog_yellow.png", description: "Il me semble que les parents sont plus ouverts à la discussion lorsqu'ils sont au parc avec leurs enfants. J'aimerais pouvoir en profiter pour rencontrer d'autres parents et échanger avec eux.")
user10 = User.create!(first_name: "Martin",last_name: "Moreau", nickname:"Matrix", address:"Monteux", kids_average_age:"8", kids_count:"4", email: "user10@email.com", password: "azerty10", avatar:"AV_sheep_purple.png", description: "Les enfants sont une source de joie et de bonheur, mais j'aimerais pouvoir discuter avec d'autres parents lors de nos sorties au parc.")

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

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030496/Parcs/GE_EAUXVIVES_vewcqe.jpg")
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

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701810290/GE_parc-cropettes-geneve_qpc9gz.jpg")
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

  #Paris

park23 = Park.new(
  name: "Parc de Belleville",
  address: "47 Rue des Couronnes, 75020 Paris, France",
  description: "À l'abordage ! Direction le parc de Belleville dans le 20e arrondissement pour partir à la découverte de la nouvelle aire de jeux inaugurée en novembre 2019. Occupée un temps par « le paquebot », impressionnante construction faite de bois et de béton, place à présent à une structure plus sécurisée, mais qui conserve néanmoins un petit côté téméraire avec sa pente inclinée à 30 degrés qui ravira les petits casse-cou à partir de 6 ans.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 6)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030077/Parcs/PAR_Belleville_m55ehx.jpg")
park23.photo.attach(io: file, filename: "Parc de Belleville.jpg", content_type: "image/jpg")

park24 = Park.new(
  name: "Parc Chapelle-Charbon",
  address: "75018 Paris, France",
  description: "Entre la porte de la Chapelle et la porte d’Aubervilliers, le parc Chapelle-Charbon s’inscrit dans le Grand Projet de Renouvellement Urbain de Paris Nord Est. Ce morceau de campagne à Paris se veut naturel et sobre en mettant l'accent sur une biodiversité, avec une flore majoritairement francilienne et la création de milieux diversifiés et équilibrés. Le parc est aussi un formidable terrain de jeux pour les enfants de 1 à 12 ans. À eux, mur d’escalade (350 m² et 680 m²), parcours d’aventure (240 m²), espace de jeux avec baby-foot, ping-pong, terrain de pétanque. Un espace de buvette, une terrasse de rencontre et une scène complètent l'ensemble.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: true,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 4)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030072/Parcs/PAR_ChapelleCarbon_y0lkmv.jpg")
park24.photo.attach(io: file, filename: "Parc Chapelle-Charbon.jpg", content_type: "image/jpg")

park25 = Park.new(
  name: "Parc de Clichy-Batignolles",
  address: "147 Rue Cardinet, 75017 Paris, France",
  description: "Le parc s'est agrandi en avril 2014 pour atteindre sa taille définitive de 10 ha fin 2020. Écolo, il s'intègre dans ce tout nouveau quartier des Batignolles. Deux zones d'aires de jeux pour les enfants et les adolescents avec des terrains pour les jeux de ballon, un skate park, un espace pour le basket-ball… mais aussi bancs et transats en font un lieu vivant où une population intergénérationnelle peut se croiser et se retrouver. Les plus âgés peuvent admirer l'énergie des plus jeunes tentant de réaliser sur leur skate des figures toujours plus acrobatiques !",
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

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030075/Parcs/PAR_ClichyBatignolle_tkjw65.jpg")
park25.photo.attach(io: file, filename: "Parc de Clichy-Batignolles.jpg", content_type: "image/jpg")

park26 = Park.new(
  name: "Parc André Citroën",
  address: "2 Rue Cauchy, 75015 Paris, France",
  description: "Le parc André-Citroën est situé à l’emplacement de l’ancienne usine parisienne de Citroën. Inauguré en 1992, d’une superficie de 14 hectares, il est l’un des parcs les plus récents de la capitale. Cet écrin de verdure offre une promenade verdoyante et variée. Outre des tables de ping-pong ou d’échecs en accès-libre, des jeux d’eau et une gigantesque serre tropicale, Là-Haut est un parcours ludique et aérien mêlant, jeux d’agilité, activité sportive, défi et moments de détente qui ravira les enfants.",
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

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030067/Parcs/PAR_Andre%CC%81Citroen_unldlv.jpg")
park26.photo.attach(io: file, filename: "Parc André Citroën.jpg", content_type: "image/jpg")

park27 = Park.new(
  name: "Parc Floral de Paris",
  address: "Route de la Pyramide, 75012 Paris, France",
  description: "Situé dans le bois de Vincennes, le Parc floral de Paris n’accueille pas seulement une merveilleuse collection de 3 000 variétés de plantes différentes. Il abrite également une belle aire de jeux pour les plus jeunes : toboggans, balançoires, tourniquet, tunnels et d'autres cachettes qui raviront les petits.… sans oublier la tour Amazone et sa grande glissade à 6 mètres de hauteur et aussi une structure à grimper impressionnante de dix mètres de haut… Mais ce qui émerveillera les plus jeunes reste sans conteste cette aire de jeux, véritable serre aux papillons plantée au sommet d’une butte à dévaler bras écartés pour avoir l’impression de voler.",
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

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030069/Parcs/PAR_Floral_mns2dm.jpg")
park27.photo.attach(io: file, filename: "Parc Floral de Paris.jpg", content_type: "image/jpg")

park28 = Park.new(
  name: "Le Jardin de Nelson Mandela",
  address: "32, rue Berger 75001 PARIS",
  description: "Face à la Canopée des Halles, le jardin Nelson-Mandela vous entraîne dans un monde ludique et coloré. L'équipe du sculpteur Henri Marquet a imaginé un univers à mi-chemin entre le Magicien d'Oz et Mario Bros, avec des jeux innovants. Ici, liberté de jouer ! Spécialement conçu pour le plaisir et l’épanouissement des enfants de 7 à 11 ans, il favorise le développement de leur imaginaire et de leurs facultés physiques ainsi que leur socialisation. Sur 2 500 m², il conjugue équipements récréatifs inédits et sculptures monumentales propices à la rêverie et à la fabrication d’histoires, espaces pour jeux spontanés, lieux de repos…",
  category: "Moyen",
  sandbox: true,
  slide: true,
  sling: true,
  water: false,
  climber: true,
  coffee: false,
  zoo: false,
  toys_rent: true,
  suitable_from_age: 7)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030066/Parcs/PAR_Mandela_hm8feu.jpg")
park28.photo.attach(io: file, filename: "Le Jardin de Nelson Mandela.jpg", content_type: "image/jpg")

  #Lyon

park29 = Park.new(
  name: "Parc de la Tête d'Or",
  address: "69006 Lyon, France",
  description: "Le parc de la Tête d’Or est l’un des plus grands parcs urbains de France. Situé sur les bords du Rhône, il offre 105 hectares de vastes pelouses, arbres centenaires, massifs fleuris, parterres de roses ou de pivoines, apportant en toutes saisons des touches colorées et parfumées.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: false,
  coffee: false,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030081/Parcs/LYO_TeteOR_mtp5ru.jpg")
park29.photo.attach(io: file, filename: "Parc de la Tête d'Or.jpg", content_type: "image/jpg")

park30 = Park.new(
  name: "Parc Blandan",
  address: "Place Blandan, 69007 Lyon, France",
  description: "Une aire de jeux nouvelle génération
  Les enfants de 3 à 12 ans peuvent partir à l'assaut de la Vague des remparts, un aménagement qui offre une aire de jeux exceptionnelle de 1000 m2.
  Cette construction en bois, spécifiquement pensée pour le parc Blandan fait appel à l'imaginaire de la fortification, permettant de grimper, attaquer, glisser, se cacher dans des niches selon l'imagination des enfants qui seront ravis de partir à l'abordage de ce vaisseau de bois truffé d'installations ludiques.
  La Vague des remparts dispose de trois niveaux, chacun accueillant des enfants d'âges différents : des chevaux en bois pour les 3-4 ans, la partie basse de la Vague et des boulets à canon pour les 4-8 ans et la partie haute, niches et passages secrets pour les 8-12 ans.
  Celle-ci propose de nombreux cheminements avec 70 mètres de cordages, 120 prises d'escalade et des niches communiquant entre elles.
  Une coursive de 50 mètres de long offre un point de vue en hauteur et dessert 3 toboggans tubulaires situés à 4,50m de hauteur.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: false,
  climber: false,
  coffee: false,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 3)

  file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030080/Parcs/LYO_Blandan_layt2u.jpg")
  park30.photo.attach(io: file, filename: "Parc Blandan.jpg", content_type: "image/jpg")

#Annecy

park31 = Park.new(
  name: "Parc des Jardins de l'Europe",
  address: "Avenue de France, 74000 Annecy, France",
  description: "À l’origine deux îles marécageuses, l’aménagement d’un jardin public présentant une collection d'arbres ornementaux participe à la valorisation des beautés naturelles des rives du lac.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: false,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

  file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030292/Parcs/ACY_Europe_gjnbjz.jpg")
  park31.photo.attach(io: file, filename: "Parc des Jardins de l'Europe.jpg", content_type: "image/jpg")

park32 = Park.new(
  name: "Parc Le Pâquier",
  address: "74000 Annecy, France",
  description: "Ce grand espace de verdure (6,2 ha) qui ouvre sur la perspective du lac et des montagnes suscite l’admiration des visiteurs.",
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

  file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030293/Parcs/ACY-Paquier_twxulk.jpg")
  park32.photo.attach(io: file, filename: "Parc Le Pâquier.jpg", content_type: "image/jpg")

park36 = Park.new(
  name: "Square de l'Evêché",
  address: "74000 Annecy, France",
  description: "La forteresse des temps modernes, conception Ville d'Annecy & Pro Urba
  Avec une structure tout bois sur la thématique du château accessible aux personnes à mobilité réduite (PMR), l’aire de jeux rappelle la forteresse qui domine la ville.

  Le choix des jeux s’est porté sur des matériaux nobles comme le bois lamellé collé Robinier (faux acacia) et l’inox, afin d’apporter un style contemporain approprié à l’air du temps.
  Le sol a été réalisé avec des dalles amortissantes recouvertes d’un gazon synthétique Terragreen afin de se fondre avec les espaces verts.

  Cet espace offre une capacité d’accueil de 60 enfants, répondant ainsi à une fréquentation importante et constante.",
  category: "Moyen",
  sandbox: true,
  slide: true,
  sling: true,
  water: false,
  climber: true,
  coffee: false,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 3)

  file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030070/Parcs/ACY_Eveche_vsb1zv.jpg")
  park36.photo.attach(io: file, filename: "Square de l'Evêché.jpg", content_type: "image/jpg")

  #Rennes

park33 = Park.new(
  name: "Parc du Thabor",
  address: "Place Saint-Mélaine, 35000 Rennes, France",
  description: "Le jardin du Thabor invite autant à être studieux que paresseux… Les étudiants des facs toutes proches viennent réviser, lire ou rêvasser, les familles se baladent en allant aux jeux d’enfants, les promeneurs admirent la roseraie et ses 2000 variétés. Au détour des chemins on découvre une grotte étrange, des cascades et des arbres, remarquables en toutes saisons.

  Dans ce lieu emblématique de la capitale bretonne, on peut également boire un verre en terrasse, faire un tour de manège ou pratiquer le running sur une boucle de 1,5Km très vallonnée qui fait le tour du Parc. Bref, le Thabor, c’est le Paradis. En pleine ville.",
  category: "Grand",
  sandbox: true,
  slide: true,
  sling: true,
  water: true,
  climber: false,
  coffee: true,
  zoo: false,
  toys_rent: false,
  suitable_from_age: 1)

  file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030078/Parcs/RNS_Thabor_fskude.jpg")
  park33.photo.attach(io: file, filename: "Parc du Thabor.jpg", content_type: "image/jpg")

  park34 = Park.new(
    name: "Parc des Tanneurs",
    address: "35000 Rennes, France",
    description: "C’est un petit coin de verdure à l’abri des regards : le Parc des Tanneurs forme un vallon arboré qui s’écoule jusqu’à la rivière l’Ille et les prairies Saint-Martin. On y pénètre par la Rue Saint-Martin, en passant par une grande grille qui donne sur une belle villa du XIXème. Une propriété prestigieuse, autrefois habitée par des familles de tanneurs, d’où son nom. Il faut oser entrer dans ce parc d’un peu plus d’un hectare pour apprécier son charme romantique et admirer de beaux spécimens de séquoias. 90 arbres sont plantés dans le vallon et participent de l’atmosphère reposante du lieu. Une balade inattendue et verdoyante, à seulement 5 minutes à pied de la Place Sainte-Anne, à prolonger en revenant par le Canal Saint-Martin et les prairies du même nom.",
    category: "Moyen",
    sandbox: true,
    slide: true,
    sling: true,
    water: false,
    climber: false,
    coffee: false,
    zoo: false,
    toys_rent: false,
    suitable_from_age: 1)

    file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030074/Parcs/RNS_Tanneurs_njkdsq.jpg")
    park34.photo.attach(io: file, filename: "Parc des Tanneurs.jpg", content_type: "image/jpg")

    park35 = Park.new(
      name: "Parc Oberthür",
      address: "35000 Rennes, France",
      description: "Le Parc Oberthür a été aménagé par le même paysagiste que celui du Thabor, Denis Bühler, quelques années avant, en 1863. Le parc forme un magnifique écrin autour de l’hôtel particulier du célèbre imprimeur rennais, François-Charles Oberthür. Pour ce notable passionné d’entomologie et de botanique, Bühler conserva les grands arbres, en particulier de magnifiques chênes, merisiers, hêtres et peupliers. Des arbres de grande taille déploient leur ombre sur ce très joli parc où il fait bon se promener : cèdres, des hêtres laciniés, des chênes pédonculés, des tilleuls argentés, des Gingko Biloba…",
      category: "Grand",
      sandbox: true,
      slide: true,
      sling: true,
      water: true,
      climber: false,
      coffee: true,
      zoo: false,
      toys_rent: false,
      suitable_from_age: 1)

      file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1702030073/Parcs/RNS_Oberthur_kbxdo0.jpg")
      park35.photo.attach(io: file, filename: "Parc Oberthür.jpg", content_type: "image/jpg")

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
park23.save
park24.save
park25.save
park26.save
park27.save
park28.save
park29.save
park30.save
park31.save
park32.save
park33.save
park34.save
park35.save
park36.save
