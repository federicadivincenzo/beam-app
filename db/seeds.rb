# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning database...'
Review.destroy_all
Concert.destroy_all
User.destroy_all
Message.destroy_all
Chatroom.destroy_all
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
    venue: Faker::Address.city,
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
puts 'Creating review...'
reviewprofile = ReviewProfile.create!(user_id: User.first.id)
user = User.last
Review.create!(
  rating: rand(1..5),
  content: Faker::Lorem.paragraph(sentence_count: 3),
  user_id: user.id,
  review_profile_id: reviewprofile.id
)
puts 'Review created ✅'
puts
puts 'Creating chatroom...'
Chatroom.create!(name: 'test', concert_id: Concert.all.sample.id)
puts 'Chatroom created ✅'
puts 'Creating messages...'
3.times do
  Message.create!(content: Faker::Company.bs, user_id: User.all.sample.id, chatroom_id: Chatroom.first.id)
end
puts 'Messages created ✅'
puts
