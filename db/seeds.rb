# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(email:"henk@jan.com", password:"1234" )




event.create!(
name: "ballenbak"
description: "lekker spelen"
starts_at: DateTime.new(2017, 5, 17, 14)
ends_at: DateTime.new(2017, 5, 18, 14, 1)
  )
