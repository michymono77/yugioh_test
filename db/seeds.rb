# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

archetype = "Blue-Eyes'"
url = "https://db.ygoprodeck.com/api/v7/cardinfo.php?archetype=#{archetype}"
card_serialized = URI.open(url).read
card = JSON.parse(card_serialized)

cards = card["data"] # array of cards

puts "Cleaning database..."
Card.destroy_all
puts 'database is clean'
puts 'creating cards'

cards.each do |card|
  Card.create(name: card["name"], image_url: card["card_images"][0]["image_url"], desc: card["desc"], race: card["race"], archetype: card["archetype"], amazon_price: card["card_prices"][0]["amazon_price"].to_i)
   puts "Duel! #{card.id} is created"
end

puts "done!"
