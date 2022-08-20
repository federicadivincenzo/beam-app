# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning database...'
User.destroy_all
Concert.destroy_all
# Review.destroy_all
# Message.destroy_all
# Chatroom.destroy_all
puts 'Database cleaned ✅'
puts
puts 'Creating users...'
User.create!(username: 'fakeuser1', email: 'fake1@gmail.com', password: 'password')
User.create!(username: 'fakeuser2', email: 'fake2@gmail.com', password: 'password')
User.create!(username: 'fakeuser3', email: 'fake3@gmail.com', password: 'password')
puts 'Users created ✅'
puts
puts 'Creating concerts...'
10.times do
  concert = Concert.new(
    artist: Faker::Music.band,
    date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
    address: Faker::Address.street_address,
    venue: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    rating: rand(1..5),
    genre: Faker::Music.genre
  )
  concert.save!
  puts "Concert with #{concert.artist} at #{concert.venue} created ✅"
end
puts '===================='
puts 'Concerts created ✅'
puts
# puts 'Creating reviews...'
# 10.times do
#   user = User.all.sample
#   review = Review.create!(
#     rating: rand(1..5),
#     content: Faker::Lorem.paragraph(sentence_count: 3),
#     user_id: user.id,
#     review_profile_id: User.where('id != ?', user.id).sample
#   )
#   puts "Review #{review.id} created ✅"
# end
# puts 'Reviews created ✅'
