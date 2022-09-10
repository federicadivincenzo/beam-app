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

random_url = URI.parse('https://source.unsplash.com/150x150/?portrait')
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
  response = Net::HTTP.get_response random_url
  user = User.create!(username: Faker::Internet.username(specifier: 5..10),
                      email: "fake#{a}@gmail.com",
                      password: 'password',
                      photo: response.to_hash['location'].first)
  ReviewProfile.create!(user_id: user.id)
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
      genre: artists[artist_name],
      photo: artist_photo,
      ticket: event['offers'] == [] ? 'No ticket available' : event['offers'][0]['url']
    )
    puts "Concert with #{parsed_concert.artist} at #{parsed_concert.venue} created ✅"
  end
end

# concert_1 = Concert.new(
#   artist: 'Embrace',
#   date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
#   address: 'Aberdeen',
#   venue: 'Aberdeen Music Hall',
#   description: Faker::Lorem.paragraph(sentence_count: 3),
#   rating: rand(1..5),
#   genre: 'Rock',
#   photo: 'https://media.ticketmaster.co.uk/tm/en-gb/dam/a/10e/8f98b1c5-1fc5-450d-bc1a-92a7e124510e_1664931_CUSTOM.jpg'
# )
# concert_1.save!
# puts "Concert with #{concert_1.artist} at #{concert_1.venue} created ✅"

# concert_2 = Concert.new(
#   artist: 'Red Hot Chilli Peppers',
#   date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
#   address: 'Florence',
#   venue: 'Firenze Rock Arena',
#   description: Faker::Lorem.paragraph(sentence_count: 3),
#   rating: rand(1..5),
#   genre: 'Rock',
#   photo: 'https://media.gettyimages.com/photos/in-this-handout-image-made-available-on-march-1-2007-by-mtv-members-picture-id73490545?s=594x594'
# )
# concert_2.save!
# puts "Concert with #{concert_2.artist} at #{concert_2.venue} created ✅"

# concert_3 = Concert.new(
#   artist: 'Harry Styles',
#   date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
#   address: 'London',
#   venue: 'Wembley stadium',
#   description: Faker::Lorem.paragraph(sentence_count: 3),
#   rating: rand(1..5),
#   genre: 'Pop',
#   photo: 'https://media.gettyimages.com/photos/in-this-handout-photo-provided-by-helene-marie-pambrun-harry-styles-picture-id931619330?s=612x612'
# )
# concert_3.save!
# puts "Concert with #{concert_3.artist} at #{concert_3.venue} created ✅"

#   concert_4 = Concert.new(
#   artist: 'The Cure',
#   date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
#   address: '16 Villa Gaudelet, Paris',
#   venue: 'Assago Forum',
#   description: Faker::Lorem.paragraph(sentence_count: 3),
#   rating: rand(1..5),
#   genre: 'Rock',
#   photo: 'https://www.thereporteronline.com/wp-content/uploads/migration/2021/06/55627e100c4a82c80e4d0a7a78834d07.jpg?w=978'
# )
# concert_4.save!
# puts "Concert with #{concert_4.artist} at #{concert_4.venue} created ✅"

# concert_5 = Concert.new(
#   artist: 'The Cure',
#   date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
#   address: '16 Villa Gaudelet, Paris',
#   venue: 'Assago Forum',
#   description: Faker::Lorem.paragraph(sentence_count: 3),
#   rating: rand(1..5),
#   genre: 'Rock',
#   photo: 'https://media.gettyimages.com/photos/the-cure-posed-studio-group-shot-circa-1984-lr-phil-thornalley-porl-picture-id85001404?s=612x612'
# )
# concert_5.save!
# puts "Concert with #{concert_5.artist} at #{concert_5.venue} created ✅"

# concert_6 = Concert.new(
#   artist: 'Serena Braccale',
#   date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
#   address: 'Roma',
#   venue: 'Auditorium Parco della Musica',
#   description: Faker::Lorem.paragraph(sentence_count: 3),
#   rating: rand(1..5),
#   genre: 'Jazz',
#   photo: 'https://www.serenabrancale.com/wp-content/uploads/2021/10/serena-brancale.jpg'
# )
# concert_6.save!
# puts "Concert with #{concert_6.artist} at #{concert_6.venue} created ✅"

# concert_7 = Concert.new(
#   artist: 'Sean Paul',
#   date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
#   address: 'London',
#   venue: 'O2 Arena',
#   description: Faker::Lorem.paragraph(sentence_count: 3),
#   rating: rand(1..5),
#   genre: 'Rap',
#   photo: 'https://pbs.twimg.com/profile_images/1085955424342425601/3pqRRO9n_400x400.jpg'
# )
# concert_7.save!
# puts "Concert with #{concert_7.artist} at #{concert_7.venue} created ✅"

# concert_8 = Concert.new(
#   artist: 'Snoop Dogg',
#   date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
#   address: 'Leeds',
#   venue: 'First direct Arena',
#   description: Faker::Lorem.paragraph(sentence_count: 3),
#   rating: rand(1..5),
#   genre: 'Rap',
#   photo: 'https://www.rollingstone.it/wp-content/uploads/2021/10/snoop-getty-ita.jpg'
# )
# concert_8.save!
# puts "Concert with #{concert_8.artist} at #{concert_8.venue} created ✅"

# concert_9 = Concert.new(
#   artist: 'Snoop Dogg',
#   date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
#   address: 'Leeds',
#   venue: 'First direct Arena',
#   description: Faker::Lorem.paragraph(sentence_count: 3),
#   rating: rand(1..5),
#   genre: 'Rap',
#   photo: 'https://www.rollingstone.it/wp-content/uploads/2021/10/snoop-getty-ita.jpg'
# )
# concert_9.save!
# puts "Concert with #{concert_9.artist} at #{concert_9.venue} created ✅"

# concert_10 = Concert.new(
#   artist: 'Muse',
#   date: Faker::Date.between(from: '2022-01-01', to: '2024-01-01'),
#   address: 'Glasgow',
#   venue: 'Bellahouston Park',
#   description: Faker::Lorem.paragraph(sentence_count: 3),
#   rating: rand(1..5),
#   genre: 'Rock',
#   photo: 'https://media.gettyimages.com/photos/british-rock-band-muse-composed-by-bassist-christopher-wolstenholme-picture-id1060029064?s=612x612'
# )
# concert_10.save!
# puts "Concert with #{concert_10.artist} at #{concert_10.venue} created ✅"

puts '===================='
puts 'Concerts created ✅'
puts
puts 'Creating review...'
10.times do
  user = User.all.sample
  Review.create!(
    rating: rand(1..5),
    content: Faker::Lorem.paragraph(sentence_count: 3),
    user_id: user.id,
    review_profile_id: User.all.where("id != ?", user.id).sample.id
  )
  puts 'Review created ✅'
end
puts
# puts 'Creating chatroom...'
# Concert.all.each do |concert|
#   Chatroom.create!(name: "test#{rand(1..10)}", concert_id: concert.id)
# end
# puts 'Chatroom created ✅'
# puts
puts 'Creating messages...'
Chatroom.all.each do |chatroom|
  user = User.all.sample
  Message.create!(content: Faker::Company.bs, user_id: user.id, chatroom_id: chatroom.id)
  UsersConcert.create!(user_id: user.id, concert_id: chatroom.concert_id)
end
puts 'Messages created ✅'
puts
