# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Party.destroy_all
User.destroy_all

# Users:
user1 = User.create!(username: 'Michael Scott', email: 'michaelscarn@email.com', password: 'holly', role: 0)

# Parties:
party1 = user1.parties.create!(movie_title: "Schindler's List", duration: 197, date: '10/13/2020', start_time: '7:00 PM CT')
party2 = user1.parties.create!(movie_title: 'Spirited Away', duration: 125, date: '11/11/2020', start_time: '4:00 PM CT')
party3 = user1.parties.create!(movie_title: 'Forrest Gump', duration: 142, date: '10/18/2020', start_time: '6:00 PM CT')
