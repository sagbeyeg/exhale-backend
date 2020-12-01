# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

status = ["incomplete", "in-progress", "completed"]

puts "🗑 Deleting old users, tasks and journal entries..." 
User.destroy_all
Journal.destroy_all
Task.destroy_all

puts "🍝 Seeding users..."
10.times do
  user = User.create!(
    name:Faker::TvShows::RickAndMorty.character,
    email_address: Faker::Internet.email,
    password: 'pass123'
  )
  puts "🍝 Seeding tasks..."
  5.times do
    Task.create!(
      title: Faker::Movie.title ,
      content: Faker::Movie.quote ,
      status: status.sample,
      user_id: user.id
    )
  end 
  
  puts "🍝 Seeding journal entries..."
  5.times do
    Journal.create!(
      title: Faker::TvShows::RickAndMorty.location,
      entry: Faker::TvShows::RickAndMorty.quote,
      date: Faker::Time.backward(days: 50, period: :all, format: :long),
      user_id: user.id,
    )
  end
end


puts "🎉 Done!"