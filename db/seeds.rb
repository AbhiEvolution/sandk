# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
100.times do
#   Post.create(title: Faker::Music.band, image: Faker::Avatar.image)
#   Comment.create(body: Faker::Quote.famous_last_words)
  Patient.create(user_id: 1,
    name: Faker::Name.name) 
end