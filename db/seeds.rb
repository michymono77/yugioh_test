# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'uri'

# archetype = "Blue-Eyes"
# url = "https://db.ygoprodeck.com/api/v7/cardinfo.php?archetype=#{archetype}"
url = "https://db.ygoprodeck.com/api/v7/cardinfo.php?name=Dark%20Magician"
card_serialized = URI.open(url).read
yugioh = JSON.parse(card_serialized)

cards = yugioh["data"] # array of cards

# puts "Cleaning database..."
# Card.destroy_all
# puts 'database is clean'
puts 'creating cards'

cards.each do |card|
  yugioh_card = Card.create(name: card["name"], image_url: card["card_images"][0]["image_url"], desc: card["desc"], race: card["race"], archetype: card["archetype"], amazon_price: card["card_prices"][0]["amazon_price"].to_i)
  file = URI.open(card["card_images"][0]["image_url"])
  yugioh_card.photo.attach(io: file, filename: "#{card["name"]}.jpg") # , content_type: 'image/jpg'
   puts "Duel! #{yugioh_card.id} is created"
end

puts "done!"


# URI bad error: just set heroku config:set CLOUDINARY_URL=cloudinary://166...AGAIN!
