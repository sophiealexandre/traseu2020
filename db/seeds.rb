# db/seeds.rb

puts 'cleaning database...'
User.destroy_all
Itinerary.destroy_all
City.destroy_all
ItineraryCity.destroy_all
Category.destroy_all
Spot.destroy_all
ItinerarySpot.destroy_all

puts 'creating users...'
users_attributes = [
  {
    email: "ferdinand@email.com",
    password: "123456",
    first_name: "ferdinand",
    following: 142,
    follower: 67,
    presentation: 'Hi there ! My idea is that I can help anyone; from someone that has never traveled or done a backpacking trip before to someone that has already traveled a lot but still might find some good advice on this site that can help him or her on the next adventure. And as a philosopher once said: "I know that I know nothing." Even after all that I have already traveled (but believe me, compared to some people that I’ve met, I’ve still only seen very little of the scope of the world), there are still a lot of things that I do not know as I am always learning and developing myself as a person.',
    rating: "4.1",
    country: "Poland, Chile, Mexico, New York",
    itineraryofuser: "Party in Peru",
    countryoforigin: "France"
  },
  {
    email: "pierre@email.com",
    password: "123456",
    first_name: "pierre",
    following: 121,
    follower: 76,
    presentation: 'Hello, you! Anyone can backpack as there are trips to suit any size wallet. Nowadays, luxurious backpacking is becoming "fashionable" where the travelers use taxi as their principal mode of transportation and stay in hostels that are more expensive than 3-star hotels!! However, there are still other backpackers that travel the world hitchhiking and staying in the houses of strangers using couchsurfing and finish their entire trip with minimal cost. For others, like myself, there is a middle ground where I try to save on transportation and accommodation, but I don’t keep my wallet closed when it’s time to have fun and adventure. For me, as long as it takes you out of your comfort zone, it is worth trying.',
    rating: "4.2",
    country: "Belgium, Peru, Canada, New York",
    itineraryofuser: "Party in Peru",
    countryoforigin: "Chile"
  },
  {
    email: "sophie@email.com",
    password: "123456",
    first_name: "sophie",
    following: 32,
    follower: 16,
    presentation: "Welcome! Although I really like backpacking as it is the most economical way of seeing the world that I have found, this does not mean that I don’t like other forms of travel. For me, the important thing is to be in a new place with the opportunity to meet other people and to see cultures and customs different from those that I already know. Therefore, the type of the trip doesn’t matter to me whether it be a package to Disneyland, a luxurious beach resort with my family, a Caribbean cruise, or a ski trip with friends. I like to explore the world, however it may be.",
    rating: "4.3",
    country: "France, Peru, Canada, New York, Japan",
    itineraryofuser: "Urban in New York",
    countryoforigin: "France"
  },
  {
    email: "yannick@email.com",
    password: "123456",
    first_name: "yannick",
    following: 122,
    follower: 86,
    presentation: 'Nice to meet you! Certainly, no matter what type of trip I am doing, I always do a Free Walking Tour if they are available in the city that I am visiting… if you have never heard of them, I will explain them more on my site as they are something not to be missed!  I will also keep a Blog with some advice about specific locations, general travel information, and some interesting stories that have happened during my wanderings. Well, that’s all for now folks. If you would like to know more about me and how I "left the system" to begin traveling around the world, continue reading below.',
    rating: "4.4",
    country: "Spain, Korea, Salvador, Peru, Canada, New York",
    itineraryofuser: "Culture in Korea",
    countryoforigin: "Belgium"
  },
]

User.create!(users_attributes)

puts 'creating itineraries...'
ferdinand = User.find_by(email: "ferdinand@email.com").id
pierre = User.find_by(email: "pierre@email.com").id
sophie = User.find_by(email: "sophie@email.com").id
yannick = User.find_by(email: "yannick@email.com").id

itineraries_attributes = [
  {
    country: "peru",
    experience: "party",
    budget: 1700,
    days: 14,
    user_id: pierre,
    title: "Not your average night club crawling",
    description: "Feeling like you already know everything about clubbing? Join this tour and recollect why you like partying so much. Remember: what happens in Peru stays in Peru.",
  },
  {
    country: "peru",
    experience: "party",
    budget: 1900,
    days: 15,
    user_id: ferdinand,
    title: "party with locals",
    description: "Want to meet local people and party without missing out on local social life?  You’re in the right place to celebrate the local folklore.",
  },
  {
    country: "peru",
    experience: "party",
    budget: 1800,
    days: 14,
    user_id: sophie,
    title: "The ultimate nightlife experience",
    description: "You’re into clubbing? So am I. Here are the best bars and clubs in Peru for you to enjoy the most exclusive experience.",
  },
  {
    country: "peru",
    experience: "urban",
    budget: 2000,
    days: 15,
    user_id: yannick,
    title: "La vida loca",
    description:"Feeling like dancing with the locals but also trekking and enjoy the beautiful nature? Kill two birds with one stone and try this tour.",
  },
  {
    country: "peru",
    experience: "culture",
    budget: 1700,
    days: 15,
    user_id: ferdinand,
    title: "Pisco wild tour Peru",
    description: "Living your life 200%, best way to discover the crasy side of peru, this trip is for you, wild people, wild place and tons of different Pisco to try!",
  },
  {
    country: "peru",
    experience: "adventure",
    budget: 1800,
    days: 15,
    user_id: pierre,
    title: "Adventure & Party Mix",
    description: "The perfect mix, want to do some raftings, atv or any other cool activity while meeting people. This trip is for you!",
  },
]

Itinerary.create!(itineraries_attributes)

puts 'creating cities...'
city_attributes = [
  {
    name: "Cuzco",
    address: "cuzco peru",
    description: "Welcome to the navel of the world. The undisputed archaeological capital of the Americas, Cuzco is the continent’s oldest continuously inhabited city and the gateway to Machu Picchu.",
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575221394/TRASEU/Traseu%20-%20Cusco/Banner%20-%20Cuzco.jpg"
  },
  {
    name: "Lima",
    address: "lima peru",
    description: "After Cairo, this sprawling metropolis is the second-driest world capital, rising above a long coastline of crumbling cliffs.",
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575583070/TRASEU/photo-1531968455001-5c5272a41129_m2xach.jpg"
  },
  {
    name: "Ica",
    address: "ica peru",
    description: "Just when you thought the landscape was dry enough for martians, out jumps Ica, Peru’s agricultural ‘miracle in the desert’ that churns out bumper crop after bumper crop of asparagus, cotton and fruits, as well as laying claim to being the nation’s leading (and best) wine producer",
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575224795/TRASEU/Traseu%20-%20Ica/Banner%20-%20Hucachina.jpg"
  },
  {
    name: "Arequipa",
    address: "arequipa peru",
    description: "Other Peruvians joke that you need a different passport to enter Peru’s second-largest city. One-tenth the size of Lima, Arequipa is its pugnacious equal in terms of cuisine, historical significance and confident self-awareness.",
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575222046/TRASEU/Traseu%20-%20Arequipa/BANNER%20-%20Arequipa.jpg"
  },
  {
    name: "Puno",
    address: "av la torre 224, puno 21001, peru",
    description: "With a regal plaza, concrete-block buildings and crumbling bricks that blend into the hills, Puno has its share of both grit and cheer. It serves as the jumping-off point for Lake Titicaca and is a convenient stop for those traveling between Cuzco and La Paz",
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240516/TRASEU/Traseu%20-%20Puno_titicaca/Banner%20%20-%20Lac%20titicaca.jpg"
  },
  {
    name: "Huaraz",
    address: "huaraz peru",
    description: "Huaraz is the restless capital of this Andean adventure kingdom and its rooftops command exhaustive panoramas of the city's dominion: one of the most impressive mountain ranges in the world",
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575481159/TRASEU/Traseu%20-%20City%20picture/Huaraz%20-%20banner.jpg"
  },
  {
    name: "Iquitos",
    address: "iquitos peru",
    description: "Linked to the outside world by air and by river, Iquitos is the world’s largest city that cannot be reached by road. It’s a prosperous, vibrant jungle metropolis and the northern Amazon Basin's chief city, teeming with the usual, inexplicably addictive Amazonian anomalies",
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575481269/TRASEU/Traseu%20-%20City%20picture/CROP-Surburbs-of-Iquitos-Getty_flgfvb.jpg"
  },
  {
    name: "Mancora",
    address: "mancora peru",
    description: "Máncora is the place to see and be seen along the Peruvian coast – in summer foreigners flock here to rub sunburned shoulders with the Peruvian jet set",
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575481453/TRASEU/Traseu%20-%20City%20picture/GettyImages-453166247_high_dcxvdh.jpg"
  },
  {
    name: "Ayacucho",
    address: "ayacucho peru",
    description: "Travelers are only just rediscovering Ayacucho's treasures. Richly decorated churches dominate the vivid cityscape alongside peach- and pastel-colored colonial buildings hung with wooden balconies.",
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575481394/TRASEU/Traseu%20-%20City%20picture/aguas-turquesas-millpu-viewpoint-2-1380x927_lic0di.jpg"
  },
  {
    name: "Puerto Maldonado",
    address: "puerto maldonado peru",
    description: "Visibly blossoming from its road connection to the outside world, Puerto Maldonado, capital of the southern jungle, has an increasingly smart sheen to the bedlam of its central streets, abuzz with tooting mototaxis.",
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575481123/TRASEU/Traseu%20-%20City%20picture/puerto-maldonado%20banner%202.jpg"
  },
]

City.create!(city_attributes)

puts 'creating itinerary_cities...'
city_1 = City.find_by(name: "Cuzco")
city_2 = City.find_by(name: "Lima")
city_3 = City.find_by(name: "Ica")
city_4 = City.find_by(name: "Arequipa")
city_5 = City.find_by(name: "Puno")
city_6 = City.find_by(name: "Huaraz")
city_7 = City.find_by(name: "Iquitos")
city_8 = City.find_by(name: "Mancora")
city_9 = City.find_by(name: "Ayacucho")
city_10 = City.find_by(name: "Puerto Maldonado")

country = "peru"
experience = "party"
itinerary_1 = Itinerary.where("country = ? AND experience = ?", country, experience).first
itinerary_2 = Itinerary.where("country = ? AND experience = ?", country, experience).second
itinerary_3 = Itinerary.where("country = ? AND experience = ?", country, experience).third

itinerary_cities_attributes = [
  { itinerary: itinerary_1, city: city_2 },
  { itinerary: itinerary_1, city: city_3 },
  { itinerary: itinerary_1, city: city_1 },
  { itinerary: itinerary_1, city: city_4 },
  { itinerary: itinerary_1, city: city_9 },
  { itinerary: itinerary_2, city: city_2 },
  { itinerary: itinerary_2, city: city_3 },
  { itinerary: itinerary_2, city: city_1 },
  { itinerary: itinerary_2, city: city_4 },
  { itinerary: itinerary_2, city: city_9},
  { itinerary: itinerary_3, city: city_2 },
  { itinerary: itinerary_3, city: city_3 },
  { itinerary: itinerary_3, city: city_1 },
  { itinerary: itinerary_3, city: city_4 },
  { itinerary: itinerary_3, city: city_9 },
]


ItineraryCity.create!(itinerary_cities_attributes)



puts 'creating categories...'
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

puts 'creating spots...'
cuzco = City.find_by(name: "Cuzco")
lima = City.find_by(name: "Lima")
arequipa = City.find_by(name: "Arequipa")

spots_attributes = [
  ############################ cuzco ############################
  {
    title: "Hanz craft beer",
    address: "portal de carnes 216, cusco, peru",
    zip_code: "zip",
    city: cuzco,
    price:32,
    longitude:-71.9808861,
    latitude:-13.5159377,
    description:"Miss your old good burger, back to some classic with the hanz craft beer bar, get also local beer, straight from the inca!",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575159334/TRASEU/Traseu%20-%20Cusco/Restaurant%20-%20Cusco%20-%20Hanz%20-%20Craft%20-%20Beer.jpg"
  },
  {
    title: "Indigo bar restaurant",
    address: "first floor, tecsecocha 415, cusco, peru",
    zip_code: "zip",
    city: cuzco,
    price: 17,
    longitude:-71.9824407,
    latitude:-13.515151,
    description:"Want a try local cuisine, go to indigo bar!",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575158724/TRASEU/Traseu%20-%20Cusco/Restaurant%20-%20Cusco%20-%20Indigo%20Bar%20Restaurant.jpg"
  },
  {
    title: "Republica del pisco",
    address: "calle plateros 354, cusco, peru",
    zip_code: "$",
    city: cuzco,
    price:52,
    longitude:-71.9824715,
    latitude:-13.5158027,
    description:"Amazing bar with more than +60 different pisco sour",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575158760/TRASEU/Traseu%20-%20Cusco/Restaurant%20-%20Cusco%20-%20Republica%20Del%20Pisco.jpg"
  },
  {
    title: "Eco-view bar",
    address: "calle tandapata 668, cusco, peru",
    zip_code: "$$",
    city: cuzco,
    price:31,
    longitude:-71.9754585,
    latitude:-13.5153496,
    description:"Get the best 360 view in town!",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575158794/TRASEU/Traseu%20-%20Cusco/Restaurant%20-%20Cuzco%20-%20Eco%20View%20Bar.jpg"
  },
  {
    title: "Wild rover hostel",
    address: "calle cuesta santa ana 782. , cusco, peru",
    zip_code: "zip",
    city: cuzco,
    price:16,
    longitude:-71.9874187,
    latitude:-13.514518,
    description:"If you are looking for a fun, friendly hostel with a great vibe and the best parties, this is it. top location with the best views – don´t believe us? ask the hundreds of people staying in cusco who come just to see our view!",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575158829/TRASEU/Traseu%20-%20Cusco/Hotel%20-%20Cuzco%20-%20Wild%20Rover.jpg"
  },
  {
    title: "The Point cusco",
    address: "meson de la estrella 172 , cusco, peru",
    zip_code: "zip",
    city: cuzco,
    price:24,
    longitude:-71.9825425,
    latitude:-13.5198854,
    description:"The Intro cusco was opened in the middle of 2006. relax or party hard with other travellers in our colonial, spacious, brand new hostel.",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575154771/TRASEU/Traseu%20-%20Cusco/Hotel%20-%20Cusco%20-%20The%20Point.jpg"
  },
  {
    title: "Intro hostels cuzco",
    address: "515, cuesta de sta. ana 561, cusco, peru",
    zip_code: "zip",
    city: cuzco,
    price:18,
    longitude:-71.9861192,
    latitude:-13.5154581,
    description:"It´s known for been a real social place (activities and layout helps) but chill out too. in our converted 300 years old mansion, we emphasize a social experience but where you can also have a good sleep (bar closes at 11pm)",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575158922/TRASEU/Traseu%20-%20Cusco/Hotel%20-%20Cusco%20-%20Intro%20Hostel.jpg"
  },
  {
    title: "Puriwasi cusco",
    address: "cuichipunku 258 - cuzco , cusco, peru",
    zip_code: "zip",
    city: cuzco,
    price:20,
    longitude:-71.9791526,
    latitude:-13.5218139,
    description: 'Translated from quechua, puriwasi "the house of the traveler", is located just 3 blocks to plaza de armas , the safest in the City.',
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575238622/TRASEU/Traseu%20-%20Cusco/HOTEL%20-%20CUSCO%20-%20Puriwasi%20Hostel.jpg"
  },
    {
    title: "Pisco cuzco tour",
    address: "something",
    zip_code: "zip",
    city: cuzco,
    price:35,
    longitude:"",
    latitude:"",
    description:"Discover the different pisco in an immersive tour of the city on those culture delicacy",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575238685/TRASEU/Traseu%20-%20Cusco/ACTIVITY%20-%20CUSCO%20-Pisco-sour.jpg"
  },
  {
    title: "Salkenta trail 1 day",
    address: "something",
    zip_code: "zip",
    city: cuzco,
    price:100,
    longitude:"",
    latitude:"",
    description:"Ready to go to machu-pichu in a very short 1 day trip salkenta trail is for you!",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575238728/TRASEU/Traseu%20-%20Cusco/ACITIVITY%20-%20CUSCO%20-%20SALKENTA%20TRAIL.jpg"
  },
  {
    title: "1 Day trip atv",
    address: "something",
    zip_code: "zip",
    city: cuzco,
    price:60,
    longitude:"",
    latitude:"",
    description:"Want to have pure sensation with your peer, try the atv for an entire day ",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575238704/TRASEU/Traseu%20-%20Cusco/ACTIVITY%20-%20CUSCO%20-%20ATV%20Tour.jpg"
  },
  {
    title: "Discovery of the inca valley",
    address: "something",
    zip_code: "zip",
    city: cuzco,
    price:40,
    longitude:"",
    latitude:"",
    description:"Want some culture after some exhaustive day in cusco, try out the inca valley with our dedicated tour guide! ",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575238812/TRASEU/Traseu%20-%20Cusco/ACTIVITY%20-%20CUSCO%20-%20Exploring-the-Sacred-Valley.jpg"
  },
  ############################ lima ############################
  {
    title: "Nuevo mundo bar",
    address: "calle manuel bonilla 103, miraflores 15074, peru",
    zip_code: "zip",
    city: lima,
    price:15,
    longitude:-77.0286846,
    latitude:-12.1198349,
    description:"Classic cuisine in the heart of miraflores",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575160383/TRASEU/Traseu%20-%20LIMA/Restaurant%20-%20LIMA%20-%20Nuevo%20Mundo.jpg"
  },
  {
    title: "Estadio restaurante",
    address: "jirón de la unión 1049, cercado de lima, peru",
    zip_code: "zip",
    city: lima,
    price:30,
    longitude:-77.0379868,
    latitude:-12.052904,
    description:"Local cuisine made with love by el chef juanito perez",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575160703/TRASEU/Traseu%20-%20LIMA/RESTAURANT%20-%20LIMA%20-%20Estadio%20Restaurant.jpg"
  },
  {
    title: "La Basilica Restaurante",
    address: "Av. primavera 640, santiago de surco, peru",
    zip_code: "zip",
    city: lima,
    price:45,
    longitude:-76.9889414,
    latitude:-12.1111414,
    description:"Miss your homecountry cuisine, la basilica offer a wide range of food",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575160408/TRASEU/Traseu%20-%20LIMA/Restaurant%20-%20LIMA%20-%20La%20Basilica.jpg"
  },
  {
    title: "Museo del pisco",
    address: "Jirón junín 201, cercado de lima, peru",
    zip_code: "zip",
    city: lima,
    price:32,
    longitude:-77.0322772,
    latitude:-12.1207357,
    description:"Peruvian cuisine with a lots of option to degust the best pisco",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575160443/TRASEU/Traseu%20-%20LIMA/Restaurant%20-%20LIMA%20-%20Museo%20del%20pisco.jpg"
  },
  {
    title: "Pool paradize",
    address: "85 District de miraflores, peru",
    zip_code: "zip",
    city: lima,
    price:25,
    longitude:-77.0242352,
    latitude:-12.124193,
    description:"Paradise, but in the city! pool paradise lima is the only hostel in the safe tourist district of miraflores with an outdoor pool! book now and enjoy the summer in lima with us! ",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575160495/TRASEU/Traseu%20-%20LIMA/HOTEL%20-%20LIMA%20-%20Pool%20Paradise.jpg"
  },
  {
    title: "Loki hostel",
    address: "Calle josé galvez 576, miraflores 15074, peru",
    zip_code: "zip",
    city: lima,
    price:22,
    longitude:-77.0338889,
    latitude:-12.1201969,
    description: 'Loki - we make your travels easy, fun and social. in the "city of kings", a perfect and centric spot to relax, meet other travellers and locals.',
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575161092/TRASEU/Traseu%20-%20LIMA/HOTEL%20-%20LIMA%20-%20LOKI%20HOSTEL.jpg"
  },
  {
    title: "Puriwasi hostel",
    address: "Av. la paz 174, miraflores 15074, peru",
    zip_code: "zip",
    city: lima,
    price:14,
    longitude:-77.0290278,
    latitude:-12.1198545,
    description:"Puriwasi offers top quality affordable accommodation in superb location. right in the center of miraflores, we are 2 blocks from the metropolitano bus station",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575161166/TRASEU/Traseu%20-%20LIMA/Hotel%20-%20LIMA%20-%20Puriwasi%20Hostel.jpg"
  },
  {
    title: "The Prime Spots",
    address: "something",
    zip_code: "zip",
    city: lima,
    price:18,
    longitude:-77.0334339,
    latitude:-12.1129596,
    description:"After more than ten years of experience of knowing what the backpacker traveler is really looking for, we decided to create prime spot, the best service in terms of accommodation of this type.",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575161213/TRASEU/Traseu%20-%20LIMA/HOTEL%20-%20LIMA%20-%20The%20prime%20Spots.jpg"
  },
  {
    title: "Bicycle tour - Miraflores",
    address: "something",
    zip_code: "zip",
    city: lima,
    price:18,
    longitude:"",
    latitude:"",
    description:"Want to discover the old lima miraflores by bicycle",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575231797/TRASEU/Traseu%20-%20LIMA/ACTIVITY%20-%20LIMA%20-%20Bicycle%20tour.jpg"
  },
  {
    title: "Surf day trip",
    address: "something",
    zip_code: "zip",
    city: lima,
    price:30,
    longitude:"",
    latitude:"",
    description:"A big sweel, one day with the best surfer from lima, this is the place to be!",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575238030/TRASEU/Traseu%20-%20LIMA/ACITIVITY%20-%20Arequipa%20-%20Surf.jpg"
  },
  {
    title: "Pub crawl - miraflores",
    address: "something",
    zip_code: "zip",
    city: lima,
    price:20,
    longitude:"",
    latitude:"",
    description:"Big night in miraflores, its the time to visit 4 bar in a crasy night! let's go lads!",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575231864/TRASEU/Traseu%20-%20LIMA/ACTIVITY%20-%20LIMA%20-%20%20bar-crawl-lima.jpg"
  },
  {
    title: "Peruvian folklore!",
    address: "something",
    zip_code: "zip",
    city: lima,
    price:25,
    longitude:"",
    latitude:"",
    description:"Tradition peruvian folklore. lima is the place to be for a cultural / party !",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575237766/TRASEU/Traseu%20-%20LIMA/ACTIVITY%20-%20LIMA%20-%20Peruvian%20folklore.jpg"
  },
  ############################ arequipa ############################
  {
    title: "Alma bar restaurant",
    address: "Calle ugarte 403, arequipa, peru",
    zip_code: "zip",
    city: arequipa,
    price:20,
    longitude:-71.5408209,
    latitude:-16.3953953,
    description:"Near by the plaza de armas, if you want to test the arequipa's delicacy, alma is one of the best spot",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575481938/TRASEU/Traseu%20-%20Arequipa/bar_qrtamy.jpg"
  },
  {
    title: "Hatumpa",
    address: "Calle ugarte 207, cercado de arequipa, peru",
    zip_code: "zip",
    city: arequipa,
    price:30,
    longitude:-71.5408209,
    latitude:-16.3953953,
    description:"Local cuisine, can't be disapointed by hatumpa",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575223702/TRASEU/Traseu%20-%20Arequipa/RESTAURANT%20-%20AREQUIPA%20-%20Hatumpa%20-.jpg"
  },
  {
    title: "El Tio Dario",
    address: "Callejón del cabildo 100, yanahuara, peru",
    zip_code: "zip",
    city: arequipa,
    price:40,
    longitude:-71.5445821,
    latitude:-16.3856723,
    description:"The well know churaseceria of arequipa is found in el tio dario",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575224128/TRASEU/Traseu%20-%20Arequipa/RESTAURANT%20-%20Arequipa%20-%20El%20tio%20Dario.jpg"
  },
  {
    title: "La Nueva Palomino",
    address: "Leoncio prado 122, yanahuara, peru",
    zip_code: "zip",
    city: arequipa,
    price:35,
    longitude:-71.5417352,
    latitude:-16.387075,
    description:"Local cuisine fusion with asian food. a classic peruvian mix",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575223890/TRASEU/Traseu%20-%20Arequipa/Restaurant%20-%20Arequipa%20-%20La%20nueva%20Palomino.jpg"
  },
  {
    title: "MB Hostel arequipa",
    address: "Calle mercaderes 135/a, arequipa, peru",
    zip_code: "zip",
    city: arequipa,
    price:22,
    longitude:-71.5377525,
    latitude:-16.3986302,
    description:"Amazing hostel arequipa has new location, now just 20 meters from the plaza de armas a priviliged location.",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575222807/TRASEU/Traseu%20-%20Arequipa/HOTEL%20-%20Arequipa%20-%20MB%20Hostel.jpg"
  },
  {
    title: "Wild rover hostel arequipa",
    address: "Calle ugarte 111, arequipa, peru",
    zip_code: "zip",
    city: arequipa,
    price:22,
    longitude:-71.5369455,
    latitude:-16.3965962,
    description:"Wild rover arequipa offers a fun, sociable and full of atmosphere hostel right in the heart of arequipa City. ",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575222941/TRASEU/Traseu%20-%20Arequipa/HOTEL%20-%20Arequipa%20-%20Wild%20rover%20Arequipa.jpg"
  },
  {
    title: "Arequipay - packers hostel",
    address: " pasaje o higgins no. 224 vallecito , arequipa, peru",
    zip_code: "zip",
    city: arequipa,
    price:18,
    longitude:-71.5430341,
    latitude:-16.4020209,
    description:"Chill out with like-minded people from around the world that travel without hassles and share laughs and experiences",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575222917/TRASEU/Traseu%20-%20Arequipa/HOTEL%20-%20Arequipa%20-%20Arequipay%20Hostel.jpg"
  },
  {
    title: "Dragonfly hostel",
    address: "calle consuelo, 209, arequipa, peru",
    zip_code: "zip",
    city: arequipa,
    price:20,
    longitude:-71.5399057,
    latitude:-16.401406,
    description:"Everything you need is here, in dragonfly hostels arequipa. our aim is to make you feel at home. ranging from spacious dorms to intimate private rooms, we have the right accommodation for you! ",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575223617/TRASEU/Traseu%20-%20Arequipa/HOTEL%20-%20Arequipa%20-%20Dragonfly%20Hostel.jpg"
  },
  {
    title: "One day trekking colca",
    address: "something",
    zip_code: "zip",
    city: arequipa,
    price:60,
    longitude:"",
    latitude:"",
    description:"Want to see condors and dive into the second deepest canyon in the world, go visit colca canyon",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575239691/TRASEU/Traseu%20-%20Arequipa/ACTIVITY%20-%20Arequipa%20-%20%20Colca%20Canyon.jpg"
  },
  {
    title: "Qochamama party",
    address: "something",
    zip_code: "zip",
    city: arequipa,
    price:25,
    longitude:"",
    latitude:"",
    description:"full arequipa experience with the classic qochamama night!",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575239799/TRASEU/Traseu%20-%20Arequipa/ACTIVITY%20-%20AREQUIPA%20-%20Qochama.jpg"
  },
  {
    title: "Peruvian dance at casona",
    address: "something",
    zip_code: "zip",
    city: arequipa,
    price:"",
    longitude:"",
    latitude:"",
    description:"peru is well know for traditional, what about a full evening learning the bases?",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575239722/TRASEU/Traseu%20-%20Arequipa/ACTIVITY%20-%20Arequipa%20-%20Peruvian%20Dance%20training.jpg"
  },
  {
    title: "Pimen river rafting",
    address: "something",
    zip_code: "zip",
    city: arequipa,
    price:50,
    longitude:"",
    latitude:"",
    description:"Want to have some fun & extrem sensation, the piment river is for you",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575239758/TRASEU/Traseu%20-%20Arequipa/Activity%20-%20Arequipa%20-%20Piment%20river.jpg"
  },
  ############################ ica ############################
  {
    title: "Tambo Tacama",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:64,
    longitude:"",
    latitude:"",
    description:"",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575228315/TRASEU/Traseu%20-%20Ica/RESTAURANT%20-%20ICA%20-%20Tambo%20Tacama.jpg"
  },
  {
    title: "La olla de juanita",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:32,
    longitude:"",
    latitude:"",
    description:"Fish fresh from ica, simple cuisine",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575228359/TRASEU/Traseu%20-%20Ica/RESTAURANT%20-%20ICA%20-%20La%20olla%20de%20juanita.jpg"
  },
  {
    title: "Restaurant el Pallar",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:24,
    longitude:"",
    latitude:"",
    description:"",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575228404/TRASEU/Traseu%20-%20Ica/RESTAURANT%20-%20ICA%20-%20Elpallar%20-%20restaurant.jpg"
  },
  {
    title: "wild olive trattoria & guest house",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:28,
    longitude:"",
    latitude:"",
    description:"",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575230831/TRASEU/Traseu%20-%20Ica/RESTAURANT%20-%20ICA%20-%20Wild%20Olive.jpg"
  },
  {
    title: "carola lodge",
    address: "av. perotti s/n, balneario e huacachina, peru",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:30,
    longitude:-75.7665557,
    latitude:-14.0866265,
    description:"carola lodge is a renovated hotel is surrounded by a huge sand dune which you can climb without any problem, we are just a few steps from the huacachina lagoon",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575227625/TRASEU/Traseu%20-%20Ica/HOTEL%20-%20ICA%20-%20Carola%20Lodge.jpg"
  },
  {
    title: "banana's adventure - huacachina",
    address: "calle angela de perotti s/n ",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:20,
    longitude:-75.7667127,
    latitude:-14.086852,
    description:"banana's is newly hotel in the heart of the oasis. everything is made to welcome you and let you enjoy what the oasis has to offer!",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575227665/TRASEU/Traseu%20-%20Ica/HOTEL%20-%20ICA%20-%20Banana%27s%20adventure.jpg"
  },
  {
    title: "wild rover backpackers hostel huacachina",
    address: "angela de perotti s/n balneario, peru",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:19,
    longitude:-75.7648962,
    latitude:-14.0865126,
    description:"are you looking for the ultimate experience? with pool parties, ice cold beers, poolside bar, right in the heart of the oasis??? you have found it!",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575227773/TRASEU/Traseu%20-%20Ica/HOTEL%20-%20ICA%20-%20Wild%20Rover%20ICA.jpg"
  },
  {
    title: "the upcycle hostel",
    address: "urb. la estancia f-5 , huacachina, peru",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:38,
    longitude:-75.7568577,
    latitude:-14.085315,
    description:"hello traveler…!!! we are glad you are checking us that means that we are doing a good job…!",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575227733/TRASEU/Traseu%20-%20Ica/HOTEL%20-%20ICA%20-%20The%20Upcycle%20Hostel.jpg"
  },
  {
    title: "buggy desert tour huacachina",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:30,
    longitude:"",
    latitude:"",
    description:"crasy buggy experience in the heart of the oasis!",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575231354/TRASEU/Traseu%20-%20Ica/ACTIVITY%20-%20ICA%20-%20BUGGY2.jpg"
  },
  {
    title: "surf in the dunes!",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:25,
    longitude:"",
    latitude:"",
    description:"never experience sandboard ? ica is known for the biggest dune in south america!",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575231411/TRASEU/Traseu%20-%20Ica/ACTIVITY%20-%20ICA%20-%20Sandboard.jpg"
  },
  {
    title: "pub-crawl ica",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:30,
    longitude:"",
    latitude:"",
    description:" 3 bars, a wild night in the oasis!",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575231528/TRASEU/Traseu%20-%20Ica/ACTIVITY%20-%20ICA%20-%20PUB%20CRAWL.jpg"
  },
  {
    title: "visit of nazca line",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ica"),
    price:50,
    longitude:"",
    latitude:"",
    description:"those lines has been here since millenaries. experience the strange mysterie around it",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575231469/TRASEU/Traseu%20-%20Ica/ACTIVITY%20-%20ICA%20-%20NAZCA%20LINE.jpg"
  },
  ############################ puno ############################
  {
    title:"inca bar",
    address:"lima 339, puno 21510, peru",
    zip_code:"zip",
    city: City.find_by(name: "Puno"),
    price:31,
    longitude:-70.0278824,
    latitude:-15.8403726,
    description:"new bar in town, large selection of amazing pisco cocktails",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575245926/TRASEU/Traseu%20-%20Puno_titicaca/RESTAURANT%20-%20PUNO%20-%20INCA%20BAR.jpg"
  },
  {
    title: "la table del inca",
    address:"ancash 239, puno 21001, peru",
    zip_code:"zip",
    city: City.find_by(name: "Puno"),
    price:35,
    longitude:-70.0298322,
    latitude:-15.8403726,
    description:"want to try the local cuisine from puno. this is a place to try",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575246000/TRASEU/Traseu%20-%20Puno_titicaca/RESTAURANT%20-%20PUNO%20-%20La%20table%20del%20Inca.jpg"
  },
  {
    title: "mojsa restaurant",
    address: "lima, puno 21001, peru",
    zip_code: "zip",
    city: City.find_by(name: "Puno"),
    price:12,
    longitude:-70.0626822,
    latitude:-15.8403633,
    description:"miss your homecountry cuisine, mojsa is the perfect place",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575246033/TRASEU/Traseu%20-%20Puno_titicaca/RESTAURANT%20-%20PUNO%20-%20Mojsa%20restaurant.jpg"
  },
  {
    title: "los uros",
    address: "isla esteves s/n, lago titicaca, puno, peru",
    zip_code: "zip",
    city: City.find_by(name: "Puno"),
    price:12,
    longitude:-70.0280579,
    latitude:-15.8278238,
    description:"located in an island, the 360view of the uros restaurant is unreal. ",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575246062/TRASEU/Traseu%20-%20Puno_titicaca/RESTAURANT%20-%20PUNO%20-%20Los%20uros.jpg"
  },
  {
    title: "sol plaza hotel",
    address: "jr. puno n°307, puno 21001, peru",
    zip_code: "zip",
    city: City.find_by(name: "Puno"),
    price:40,
    longitude:-70.0292115,
    latitude:-15.8406116,
    description:"",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575242927/TRASEU/Traseu%20-%20Puno_titicaca/HOTEL%20-%20PUNO%20-%20sol-plaza-hotel.jpg"
  },
  {
    title: "uros lake titicaca lodge",
    address: "titicaca, puno, peru",
    zip_code: "zip",
    city: City.find_by(name: "Puno"),
    price:40,
    longitude:-69.9764087,
    latitude:-15.820714,
    description:"wonderfull view on the titicaca lake, this hotel offer a wide range of activities",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575242686/TRASEU/Traseu%20-%20Puno_titicaca/HOTEL%20-%20PUNO%20-%20uros-titicaca-lodge.jpg"
  },
  {
    title: "hotel rosario lago ticicaca",
    address: "avenida costanera esq rigoberto paredes, copacabana, bolivia",
    zip_code: "zip",
    city: City.find_by(name: "Puno"),
    price:60,
    longitude:"",
    latitude:"",
    description:"amazing view, unbeatable location and reasonable price. rosario is the perfect place to discover what has to offer the ticicaca lake",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575242020/TRASEU/Traseu%20-%20Puno_titicaca/HOTEL%20-%20PUNO%20-%20Hotel%20Rosario%20lago%20titicaca.jpg"
  },
  {
    title: "ecolodge la estancia",
    address: "lago titicaca, isla del sol, bolivia",
    zip_code: "zip",
    city: City.find_by(name: "Puno"),
    price:70,
    longitude:-69.1520687,
    latitude:-16.02915,
    description:"want to live like a local, ecolodge is for you!",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240980/TRASEU/Traseu%20-%20Puno_titicaca/HOTEL%20-%20PUNO%20-%20Ecolodge%20la%20estancia.jpg"
  },
  {
    title: "fishing in ticicaca",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Puno"),
    price:60,
    longitude:"",
    latitude:"",
    description:"catch the best fish at 3500meters in the biggest lake in the world",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240626/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20%20-%20PUNO%20-%20FISHING%20TITICACA.jpg"
  },
  {
    title: "boat tour titicaca",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Puno"),
    price:80,
    longitude:"",
    latitude:"",
    description:"all day to discover the mystery and beauty of the famous lac titicaca",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240590/TRASEU/Traseu%20-%20Puno_titicaca/Lago%20titicaca.jpg"
  },
  {
    title: "visit of the isla de la luna",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Puno"),
    price:60,
    longitude:"",
    latitude:"",
    description:"isla de la luna for an entire day of history between bolivia & peru",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575241699/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20PUNO%20-%20Isla%20de%20la%20Luna.jpg"
  },
  {
    title: "jirón lima tour",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Puno"),
    price: 40,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  ##### PUERTO MALDONADO ###
  {
    title: "ECO-lodge junglino",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Puerto Maldonado"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  {
    title: "La casita en la selva",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Puerto Maldonado"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  {
    title: "Jungle Tour",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Puerto Maldonado"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  #### Huaraz ###
  {
    title: "La casa en la Montaña",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Huaraz"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  {
    title: "La cocina de bernada",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Huaraz"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  {
    title: "Trek in the Montain",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Huaraz"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  ### Iquitos
  {
    title: "River hotel Iquitos",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Iquitos"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  {
    title: "La selvita restaurant",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Iquitos"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg",
  },
  {
    title: "Fishing In the Amazona",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Iquitos"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  ### Mancora ###
  {
    title: "Surfhouse mancora",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Mancora"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  {
    title: "Beach club bar",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Mancora"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  {
    title: "Surf Session with locals",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Mancora"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  ### AYACUCHO ##
    {
    title: "Ayacuchino lodge",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ayacucho"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "hotel"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  {
    title: "la cocina de la Montaña",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ayacucho"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "restaurant"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
  {
    title: "Trek along the river",
    address: "something",
    zip_code: "zip",
    city: City.find_by(name: "Ayacucho"),
    price: 30,
    longitude:"",
    latitude:"",
    description:"discover the heart of the puno city with a guide",
    category: Category.find_by(title: "activity"),
    image: "https://res.cloudinary.com/pierreja/image/upload/v1575240661/TRASEU/Traseu%20-%20Puno_titicaca/ACTIVITY%20-%20Puno%20-%20Fiesta%20de%20Puno.jpg"
  },
]

Spot.create!(spots_attributes)

puts 'creating itinerary_spots...'

itinerary_spots_attributes = [
  {
    itinerary: Itinerary.first,
    spot: Spot.first,
    days: 3
  },
]

ItinerarySpot.create!(itinerary_spots_attributes)

puts 'finished!'
