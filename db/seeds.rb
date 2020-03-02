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
puts 'creating Location'
UserLocation.destroy_all
puts 'creating Photo'
Post.destroy_all
puts 'creating Post'
Photo.destroy_all
puts 'creating Photo'

5.times do
  User.create(name: Faker::Games::Heroes, user_name: Faker::Internet.email, password: 'test', bio: Faker::Quote.famous_last_words, contact: Faker::PhoneNumber)
end

5.times do
  Location.create(name: Faker::Nation.capital_city, latitude: '123456', longtitude: '54321', description: Faker::TvShows::Community.quotes)
end

5.times do
  UserLocation.create(user_id: rand(1..5), location_id: rand(1..5))
end

5.times do
  Post.create(content: Faker::TvShows::Friends.quote, rating: rand(1..5), location_id: rand(1..5))
end

5.times do
  Photo.create(url: 'http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach02.jpg', title: Faker::Book.title, location_id: rand(1..5))
end
