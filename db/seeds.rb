# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all
Event.destroy_all

user1 = User.create!(email:"henk@jan.com", password:"123456" )
user2 = User.create!(email:"mark@jan.com", password:"123456" )
user3 = User.create!(email:"daan@jan.com", password:"123456" )
user4 = User.create!(email:"aad@jan.com", password:"123456" )
user5 = User.create!(email:"vos@jan.com", password:"123456" )


kinderachtig = Category.create!(name: "kinderachtig")
stom = Category.create!(name: "stom")
leuk = Category.create!(name: "leuk")
adult = Category.create!(name: "adult")

event1 = Event.create!(
name: "ballenbak",
description: "lekker spelen",
starts_at: DateTime.new(2017, 5, 17, 14),
ends_at: DateTime.new(2017, 5, 18, 14, 1),
user: user1,
price: 50,
categories: [leuk, kinderachtig]
)

event2 = Event.create!(
name: "fetish party",
description: "lekker spelen",
starts_at: DateTime.new(2017, 5, 17, 14),
ends_at: DateTime.new(2017, 5, 18, 14, 1),
user: user1,
price: 25,
categories: [leuk, adult]
)

event3 = Event.create!(
name: "wijn drinken",
description: "HI HA HONDELUL",
starts_at: DateTime.new(2017, 5, 17, 14),
ends_at: DateTime.new(2017, 5, 18, 14, 1),
user: user2,
price:10,
categories: [leuk, adult]
)

Registration.create(event: event1, user: user1, price: event1.price, status: true, guests_count: 3)
Registration.create(event: event2, user: user1, price: event2.price, status: true, guests_count: 1)
Registration.create(event: event2, user: user2, price: event2.price, status: true, guests_count: 2)
