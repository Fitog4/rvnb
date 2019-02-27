require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BookingRequest.destroy_all
Rv.destroy_all
User.destroy_all

puts 'Everything is destroyed!'

puts 'Creating 100 fake users...'
100.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Name.name
  )
  user.save!
end
puts 'Finished!'

puts 'Creating 100 fake RVs...'
100.times do
  rv = Rv.new(
    category: ['Motorhome', 'Toterhome', 'Diesel Pusher', 'Travel Trailer', 'Expandable Travel Trailer', '5th Wheel RV', 'Toy Hauler' 'Camper', 'Van', 'Teardrop Trailer', 'Horse Trailer', 'Ice Fishing RV
', 'Winnebago'].sample,
    user: User.all.sample,
    travelling_seats: rand(2..8),
    beds: rand(2..8),
    available_in: Faker::Address.full_address,
    available_from: Faker::Date.between('2019-03-01', '2019-05-01'),
    available_till: Faker::Date.between('2019-05-01', '2019-12-01'),
    price_per_night: rand(35..200),
    model: Faker::Vehicle.model
  )
  rv.save!
end
puts 'Finished!'

puts 'Creating 100 fake booking requests...'
100.times do
  booking_request = BookingRequest.new(
    status: ['pending', 'approved', 'paid'].sample,
    location: Faker::Address.full_address,
    date_from: Faker::Date.between('2019-03-01', '2019-05-01'),
    date_till: Faker::Date.between('2019-05-01', '2019-12-01'),
    user: User.all.sample,
    rv: Rv.all.sample
  )
  booking_request.save!
end
puts 'Finished!'






