# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
UserColocation.destroy_all
Colocation.destroy_all
User.destroy_all
puts "create friends colo"
friends = Colocation.create!(name: "Friends")
puts "users creation.."
joey = User.create!(email: "joey@mail.fr", nickname: "Joey", password: "azerty")
rachel = User.create!(email: "rachel@mail.fr", nickname: "Rachel", password: "azerty")
ross = User.create!(email: "ross@mail.fr", nickname: "Ross", password: "azerty")
chandler = User.create!(email: "chandler@mail.fr", nickname: "Chandler", password: "azerty")
monica = User.create!(email: "monica@mail.fr", nickname: "Monica", password: "azerty")
puts "usercoloc creation.."
UserColocation.create!(colocation_id: friends.id, user_id: joey.id)
UserColocation.create!(colocation_id: friends.id, user_id: rachel.id)
UserColocation.create!(colocation_id: friends.id, user_id: ross.id)
UserColocation.create!(colocation_id: friends.id, user_id: chandler.id)
UserColocation.create!(colocation_id: friends.id, user_id: monica.id)
