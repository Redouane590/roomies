# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Message.destroy_all
Chatroom.destroy_all
UserColocation.destroy_all
Colocation.destroy_all
User.destroy_all
puts "create friends colo"
friends = Colocation.create!(name: "Friends")
Chatroom.create!(colocation_id: friends.id)
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
puts "all done"
puts "create notes..."
Note.create(title: "Mot de passe wifi", content: "Asx@l597#ffez", colocation_id: friends.id)
Note.create(title: "Numero du proprio", content: "0783407855", colocation_id: friends.id)
Note.create(title: "Contact du plombier", content: "Many et ses outils: 0783407855", colocation_id: friends.id)
Note.create(title: "Le chat", content: "N'oublier pas de nourrir le chat, un paquet au matin et un au soir", colocation_id: friends.id)
Note.create(title: "Soirée de noel", content: "Oubliez pas les preparatifs de noel", colocation_id: friends.id)
Note.create(title: "Planning de menage", content: "N'oubliez de faire le ménage quand c'est votre tour (voir planning)", colocation_id: friends.id)
Note.create(title: "Bug de la TV", content: "Quand la télé ne veux pas s'allumer mettez lui un coup de boule et rallumez la !", colocation_id: friends.id)
Note.create(title: "Anniv de rachel", content: "Le 10 décembre !!", colocation_id: friends.id)
