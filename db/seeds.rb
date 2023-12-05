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
park1 = Park.new(name: "Parc de Milan",
  address: "Pl. de Milan, 1007 Lausanne, Suisse",
  description: "Il est sans doute difficile de trouver un enfant lausannois qui ne connaisse pas la place de Milan et son exceptionnelle place de jeux. Mais impossible de limiter ce parc à son seul aspect ludique. La place de Milan et le crêt de Montriond sont aussi des témoins de l’histoire lausannoise.",
  category: "Grand",
  sandbox: false,
  slide: true,
  sling: false,
  water: false,
  climber: false,
  coffee: false,
  zoo: true,
  toys_rent: false,
  suitable_from_age: 2)

file = URI.open("https://res.cloudinary.com/dd6jjbnqk/image/upload/v1701781953/Parc_de_Milan_gcngdu.jpg")
park1.photo.attach(io: file, filename: "Parc de Milan.jpg", content_type: "image/jpg")
puts "Sauvegarde les parcs"
park1.save

puts "Creating chatroom"

chatroom1 = Chatroom.new(name: "Parc de Milan", park_id: park1.id)
# chatroom2 = Chatroom.create!(name: "Nemo", park_id: 2)
# chatroom3 = Chatroom.create!(name: "Dory", park_id: 3)

chatroom1.save
