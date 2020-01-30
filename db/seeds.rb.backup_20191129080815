# db/seeds.rb

puts 'Cleaning database...'
User.destroy_all
Itinerary.destroy_all
City.destroy_all
ItineraryCity.destroy_all
Category.destroy_all
Spot.destroy_all
ItinerarySpot.destroy_all

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

puts 'Creating cities...'
city_attributes = [
  { name: "Cuzco" },
  { name: "Lima" },
  { name: "Ica" },
  { name: "Arequipa" },
  { name: "Puno" },
  { name: "Nazca" },
  { name: "Puerto maldonado" },
  { name: "Huaraz" },
  { name: "Iuaraz" },
  { name: "Mancora" },
]

City.create!(city_attributes)

puts 'Creating itinerary_cities...'
city_1 = City.find(1)
city_2 = City.find(2)
city_3 = City.find(3)
city_4 = City.find(4)
city_5 = City.find(5)
city_6 = City.find(6)
city_7 = City.find(7)
city_8 = City.find(8)
city_9 = City.find(9)
city_10 = City.find(10)

itinerary_cities_attributes = [
  { itinerary_id: 1, city: city_1 },
  { itinerary_id: 1, city: city_2 },
  { itinerary_id: 1, city: city_3 },
  { itinerary_id: 1, city: city_4 },
  { itinerary_id: 1, city: city_5 },
  { itinerary_id: 2, city: city_6 },
  { itinerary_id: 2, city: city_7 },
  { itinerary_id: 2, city: city_8 },
  { itinerary_id: 2, city: city_9 },
  { itinerary_id: 2, city: city_10 },
  { itinerary_id: 3, city: city_1 },
  { itinerary_id: 3, city: city_3 },
  { itinerary_id: 3, city: city_5 },
  { itinerary_id: 3, city: city_7 },
  { itinerary_id: 3, city: city_9 },
]

ItineraryCity.create!(itinerary_cities_attributes)

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
  },
]

Category.create!(category_attributes)

puts 'Creating spots...'
spots_attributes = [
  {
    title: "Restaurant Chez Claudette",
    address: "Laurier Avenue East",
    zip_code: "H2T 1G7",
    city: City.find_by(name: "Cuzco"),
    category: Category.find_by(title: "restaurant"),
  },
]

Spot.create!(spots_attributes)

puts 'Creating itinerary_spots...'
spot_1 = Spot.find(1)

itinerary_spots_attributes = [
  {
    itinerary_id: 1,
    spot: spot_1,
    days: 3
  },
]

ItinerarySpot.create!(itinerary_spots_attributes)

puts 'Finished!'
