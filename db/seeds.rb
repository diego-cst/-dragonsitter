# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Destroy bookings"
Booking.destroy_all if Rails.env.development?

puts "Destroy dragons"
Dragon.destroy_all if Rails.env.development?

puts "Destroy users"
User.destroy_all if Rails.env.development?

puts "Resetting IDs"
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "Creating users"
User.create!([
  {
    name: "Harry Potter",
    email: "hpotter@example.com",
    password: "123456"
  },
  {
    name: "Sauron",
    email: "sauron@example.com",
    password: "123456"
  },
  {
    name: "Daenerys Targaryen",
    email: "dtargaryen@example.com",
    password: "123456"
  },
  {
    name: "Steve",
    email: "steve@example.com",
    password: "123456"
  },
  {
    name: "Hiccup Horrendous Haddock III",
    email: "hhorrendous@example.com",
    password: "123456"
  }
]);

User.all.each do |user|
  puts "Created #{user.name}"
end

puts "Creating dragons"
Dragon.create!([
  {
    name: "Chinese Fireball",
    color: "scarlet",
    size: 2,
    diet: "Its diet consists of most mammals, usually preferring pigs and humans.",
    temperament: 3,
    fire: 1,
    location: "Berlin",
    price: 50,
    user_id: 1,
    description: "The Chinese Fireball, also known as the Liondragon, is a dragon native to China. It is a brilliant red and gold dragon, named for the rounded balls of flame that shoot from its nostrils. The Fireball is scarlet and smooth scaled with a fringe of golden spikes around its snub-snouted face and extremely protuberant eyes. They weigh between two and four tons. Its name is derived from the mushroom-shaped flame that comes from its nostrils when angered, along with the large mushroom-shaped flame it shoots from its mouth."
  },
  {
    name: "Fellbeast",
    color: "black",
    size: 3,
    diet: "Its diet consists mostly of animals, though a stray orc or a human prisoner have occasionally gone amiss.",
    temperament: 3,
    fire: 0,
    location: "Berlin",
    price: 200,
    user_id: 2,
    description: "Identical in appearance to dragons, the fellbeasts were described as large, winged creatures without feathers. Its pinions were in between horned fingers; and its body gave off a stench. It is possible that fellbeasts came from 'an older world'. The dark lord Sauron bred these fellbeasts and gave them to his servants."
  },
  {
    name: "Norwegian Ridgeback",
    color: "brown",
    size: 0,
    diet: "In 1802, a Norwegian Ridgeback is reported to have carried off a Whale Calf off the coast of Norway.",
    temperament: 0,
    fire: 0,
    location: "Berlin",
    price: 10,
    user_id: 3,
    description: "The Norwegian Ridgeback is a dragon native to Norway, and its typical habitat is the Northern mountains. It was said to physically resemble a Hungarian Horntail. It resembles the Hungarian Horntail, except for the black ridges on its back, the browner texture in its scales, and its less hostile attitude. It has venomous fangs, and its food of choice is large mammals, including water mammals, which is unusual for a dragon. Its eggs are black, and young Ridgebacks develop the ability to shoot flame earlier than any other breeds (around one to three months). Female Ridgebacks are generally more ferocious than the males."
  },
  {
    name: "Ukrainian Ironbelly",
    color: "metallic grey",
    size: 4,
    diet: "His diet consists of the gold treasure it protects from the greedy dwarves",
    temperament: 2,
    fire: 1,
    location: "Berlin",
    price: 180,
    user_id: 4,
    description: "The Ukrainian Ironbelly is a species of dragon native to Ukraine. It is said to be the largest dragon species in the world. Ironbellies have been subject to constant observation by the Ukrainian wizarding authorities, ever since a particular Ironbelly carried off a sailing ship from the Black Sea in 1799. Thankfully, the boat was empty at the time. "
  },
  {
    name: "Toothless",
    color: "black",
    size: 1,
    diet: "Feeds mostly on fish in great quantity",
    temperament: 1,
    fire: 1,
    location: "Berlin",
    price: 160,
    user_id: 5,
    description: "Toothless has a rather large scar on his right shoulder/neck which is around a foot in length with a width of about an inch. Toothless's eyes are a bright green, sometimes acid or emerald green. They are located very near the front of his face giving him excellent depth perception and reflexes in flight. He can narrow his pupils to slits when threatened or angry, similar to that of a cat. However, when he is docile or happy, his pupils dilate and become more dog-like. Toothless gets his name from his ability to retract his teeth. While in Alpha Mode, Toothless has blue markings on his back, fins, spines, and forehead, glowing because of the fire. His nostrils glow, too."
  }
]);

Dragon.all.each do |dragon|
  puts "Created #{dragon.name}"
end

puts "Creating bookings"

Booking.create!([
  {
    start_date: DateTime.strptime("08/14/2018", "%m/%d/%Y"),
    end_date: DateTime.strptime("09/01/2018", "%m/%d/%Y"),
    dragon_id: 1,
    user_id: 2,
    status: 0
  },
  {
    start_date: DateTime.strptime("08/20/2018", "%m/%d/%Y"),
    end_date: DateTime.strptime("09/23/2018", "%m/%d/%Y"),
    dragon_id: 2,
    user_id: 1,
    status: 0
  },
  {
    start_date: DateTime.strptime("07/19/2018", "%m/%d/%Y"),
    end_date: DateTime.strptime("07/21/2018", "%m/%d/%Y"),
    dragon_id: 3,
    user_id: 4,
    status: 0
  },
  {
    start_date: DateTime.strptime("07/19/2018", "%m/%d/%Y"),
    end_date: DateTime.strptime("07/21/2018", "%m/%d/%Y"),
    dragon_id: 4,
    user_id: 3,
    status: 0
  }
]);

puts "Seed completed"


