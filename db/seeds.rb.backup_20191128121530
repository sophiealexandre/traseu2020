# db/seeds.rb

puts 'Cleaning database...'
User.destroy_all
Category.destroy_all
Itinerary.destroy_all

puts 'Creating categories...'
category_attributes = [
  {
    title: "restaurant"
  },
  {
    title: "hotel"
  },
  {
    title: "activity"
  }
]

Category.create!(category_attributes)

puts 'Creating users...'
users_attributes = [
  {
    email: "ferdinand@email.com",
    password: "123456",
    first_name: "ferdinand"
  },
  {
    email: "pierre@email.com",
    password: "123456",
    first_name: "pierre"
  },
  {
    email: "sophie@email.com",
    password: "123456",
    first_name: "sophie"
  },
  {
    email: "yannick@email.com",
    password: "123456",
    first_name: "yannick"
  },
]

User.create!(users_attributes)

puts 'Creating Itineraries...'
itineraries_attributes = [
  {
    country: "Peru",
    experience: "party",
    budget: 1000,
    days: 15,
    user_id: 1
  },
  {
    country: "Peru",
    experience: "party",
    budget: 1000,
    days: 15,
    user_id: 1
  },
  {
    country: "Peru",
    experience: "party",
    budget: 1000,
    days: 15,
    user_id: 1
  },
  {
    country: "Peru",
    experience: "urban",
    budget: 1000,
    days: 15,
    user_id: 1
  },
  {
    country: "Peru",
    experience: "culture",
    budget: 1000,
    days: 15,
    user_id: 1
  },
  {
    country: "Peru",
    experience: "adventure",
    budget: 1000,
    days: 15,
    user_id: 1
  },
]

Itinerary.create!(itineraries_attributes)

puts 'Finished!'



