# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
puts 'creating User'
Location.destroy_all
# puts 'creating Location'
# UserLocation.destroy_all
# puts 'creating Photo'
# Post.destroy_all
# puts 'creating Post'
# Photo.destroy_all
# puts 'creating Photo'
# Place.destroy_all
# puts 'creating Places'

5.times do
  User.create(name: Faker::Games::Heroes.name, user_name: Faker::Internet.email, password: 'test', bio: Faker::Quote.famous_last_words, contact: Faker::PhoneNumber.cell_phone)
end

Location.create([
  { "name": "New York", "latitude": 40.7128,"longitude": 74.0060},
  { "name": "Chicago", "latitude": 41.8781, "longitude": 87.6298},
  { "name": "Lost Angeles", "latitude": 34.0522, "longitude": 118.2437},
  { "name": "Pyongyang", "latitude": 39.0392, "longitude": 125.7625},
  { "name": "London", "latitude": 51.5074, "longitude": 0.1278},
  { "name": "Paris", "latitude": 48.8566, "longitude": 2.3522},
  { "name": "Beijing", "latitude": 39.9042, "longitude": 116.4074},
  { "name": "Sydney", "latitude": 33.8688, "longitude": 151.2093},
  { "name": "Seoul", "latitude": 37.5665, "longitude": 26.9780},
  ])

# 5.times do
#   Location.create(name: Faker::Nation.capital_city, latitude: rand(1..50), longitude: rand(1..50), description: Faker::TvShows::Community.quotes)
# end
# 1.times do
#   UserLocation.create(user_id: 1, location_id: 1)
# end


# 5.times do
#   Post.create(content: Faker::TvShows::Friends.quote, rating: rand(1..5), location_id: rand(1..5), user_id: rand(1..5))
# end

# 5.times do
#   Photo.create(title: Faker::Book.title, location_id: rand(1..25), user_id: rand(1..25), image: "/images/background.jpeg")
# end
