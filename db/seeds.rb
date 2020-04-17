puts 'Deleting existing data...'
Flat.destroy_all

puts 'Generating new data...'
10.times do
  flat = Flat.create!(
    {
      name: Faker::App.name,
      address: Faker::Address.street_address,
      description: Faker::Lorem.paragraph,
      price_per_night: [100, 150, 200, 250].sample,
      number_of_guests: (1..5).to_a.sample,
    }
  )
  puts "Flat with ID: #{flat.id} was created."
end

puts 'Done'
