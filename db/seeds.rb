# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'uri'
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Review.destroy_all
Concert.destroy_all
User.destroy_all
Message.destroy_all
Chatroom.destroy_all
puts 'Database cleaned ✅'
puts
puts 'Creating users...'
for a in 1..10 do
  user = User.create(username: Faker::Internet.username(specifier: 5..10),
                     email: "fake#{a}@gmail.com",
                     password: 'password',
                     bio: Faker::TvShows::Friends.quote)
  user.photo = "https://ui-avatars.com/api/?name=#{user.username}"
  user.save!
  ReviewProfile.create!(user_id: user.id)
  puts "User #{a} created ✅"
end
puts 'Users created ✅'
puts
puts 'Creating concerts...'

BANDSINTOWN_API = 'af3c26c861035dac4dbd142595c34c18'

artists = { 'Bad Bunny': 'Reggaeton',
            'Ed Sheeran': 'Pop',
            'The Weeknd': 'Pop',
            'Justin Bieber': 'Pop',
            'Taylor Swift': 'Pop',
            'Ariana Grande': 'Pop',
            'Eminem': 'Hip Hop',
            'Post Malone': 'Hip Hop',
            'BTS': 'K-Pop',
            'J Balvin': 'Reggaeton',
            'Kanye West': 'Hip Hop',
            'Billie Eilish': 'Pop',
            'Juice WRLD': 'Hip Hop',
            'Dua Lipa': 'Pop',
            'Coldplay': 'Pop',
            'Imagine Dragons': 'Rock',
            'XXXTENTACION': 'Hip Hop',
            'Ozuna': 'Reggaeton',
            'Khalid': 'Pop',
            'Rihanna': 'Pop',
            'Travis Scott': 'Hip Hop',
            'Maroon 5': 'Pop',
            'David Guetta': 'Pop',
            'Bruno Mars': 'R&B',
            'Daddy Yankee': 'Reggaeton',
            'Calvin Harris': 'Pop',
            'Kendrick Lamar': 'Hip Hop',
            'Sam Smith': 'Pop',
            'Beyonce': 'Pop',
            'Future': 'Hip Hop',
            'One Direction': 'Pop',
            'The Chainsmokers': 'Pop',
            'Chris Brown': 'Hip Hop',
            'Adele': 'Pop',
            'Lady Gaga': 'Pop',
            'J. Cole': 'Hip Hop',
            'Nicki Minaj': 'Hip Hop',
            'Anuel AA': 'Reggaeton',
            'Halsey': 'Pop',
            'The Beatles': 'Rock',
            'Selena Gomez': 'Pop',
            'Maluma': 'Reggaeton',
            'Sia': 'Pop',
            'Harry Styles': 'Pop',
            'Marshmello': 'Pop',
            'Linkin Park': 'Rock',
            'Twenty One Pilots': 'Pop' }

artists.each do |artist|
  url = "https://rest.bandsintown.com/artists/#{artist[0].match(' ') ? artist[0].to_s.gsub(' ', '%20') : artist[0]}/events?app_id=#{BANDSINTOWN_API}"
  artist_serialized = URI.parse(url).open.read
  parsed_artists = JSON.parse(artist_serialized)
  next if parsed_artists == []

  artist_name = parsed_artists[0]['artist']['name']
  artist_photo = parsed_artists[0]['artist']['image_url']

  parsed_artists.each do |event|
    parsed_concert = Concert.create!(
      artist: artist_name,
      date: event['starts_at'],
      latitude: event['venue']['latitude'],
      longitude: event['venue']['longitude'],
      venue: event['venue']['name'],
      description: event['description'],
      genre: artists[artist_name.to_sym],
      photo: artist_photo,
      ticket: event['offers'] == [] ? 'No ticket available' : event['offers'][0]['url']
    )
    puts "Concert with #{parsed_concert.artist} at #{parsed_concert.venue} created ✅"
  end
end
puts 'Concerts created ✅'
puts
puts 'Creating review...'
15.times do
  user = User.all.sample
  Review.create!(
    rating: rand(1..5),
    content: Faker::Lorem.paragraph(sentence_count: 3),
    user_id: user.id,
    review_profile_id: User.all.where('id != ?', user.id).sample.id
  )
  puts 'Review created ✅'
end
puts
puts 'Creating messages...'
Chatroom.take(20).each do |chatroom|
  user = User.all.sample
  Message.create!(content: Faker::Company.bs, user_id: user.id, chatroom_id: chatroom.id)
  UsersConcert.create!(user_id: user.id, concert_id: chatroom.concert_id)
end
puts 'Messages created ✅'
puts
