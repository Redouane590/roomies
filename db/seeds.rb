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
file_joey = URI.open("https://i.pinimg.com/originals/32/cb/60/32cb600629bfdad9cbe5f138a67dc7d3.jpg")
joey = User.create!(email: "joey@mail.fr", nickname: "Joey", password: "azerty", phone_number: "0628013779")
joey.photo.attach(io: file_joey, filename: "Joey.jpg", content_type: "image/jpg")
joey.save
file_rachel = URI.open("https://resize.elle.fr/article_960_webp/var/plain_site/storage/images/loisirs/series/aviez-vous-remarque-l-uniforme-de-rachel-green-quand-elle-travaillait-au-central-perk-3522407/83479163-1-fre-FR/Aviez-vous-remarque-l-uniforme-de-Rachel-Green-quand-elle-travaillait-au-Central-Perk.jpg")
rachel = User.create!(email: "rachel@mail.fr", nickname: "Rachel", password: "azerty", phone_number: "0627013799")
rachel.photo.attach(io: file_rachel, filename: "Joey.jpg", content_type: "image/jpg")
rachel.save
file_ross = URI.open("https://static.wikia.nocookie.net/friends/images/7/70/192.jpg/revision/latest?cb=20130305164518&path-prefix=fr")
ross = User.create!(email: "ross@mail.fr", nickname: "Ross", password: "azerty", phone_number: "0628014792")
ross.photo.attach(io: file_ross, filename: "Joey.jpg", content_type: "image/jpg")
ross.save
file_chandler = URI.open("https://static.wikia.nocookie.net/friends/images/d/d2/ImagesCAWIP3G7.jpg/revision/latest?cb=20120326174426&path-prefix=fr")
chandler = User.create!(email: "chandler@mail.fr", nickname: "Chandler", password: "azerty", phone_number: "0728013749")
chandler.photo.attach(io: file_chandler, filename: "Joey.jpg", content_type: "image/jpg")
chandler.save
file_monica = URI.open("https://static.wikia.nocookie.net/friends/images/7/75/Monica.jpg/revision/latest/scale-to-width-down/180?cb=20120326163954&path-prefix=fr")
monica = User.create!(email: "monica@mail.fr", nickname: "Monica", password: "azerty", phone_number: "0738013791")
monica.photo.attach(io: file_monica, filename: "Joey.jpg", content_type: "image/jpg")
monica.save
puts "usercoloc creation.."
UserColocation.create!(colocation_id: friends.id, user_id: joey.id)
UserColocation.create!(colocation_id: friends.id, user_id: rachel.id)
UserColocation.create!(colocation_id: friends.id, user_id: ross.id)
UserColocation.create!(colocation_id: friends.id, user_id: chandler.id)
UserColocation.create!(colocation_id: friends.id, user_id: monica.id)
puts "all done"
puts "create notes..."
Note.create(title: "Mot de passe wifi", content: "Asx@l597#ffeDCzP2", colocation_id: friends.id)
Note.create(title: "Numéro du proprio", content: "0783407855", colocation_id: friends.id)
Note.create(title: "Contact du plombier", content: "Many et ses outils: 0783407855", colocation_id: friends.id)
Note.create(title: "Le chat", content: "N'oubliez pas de nourrir le chat, une boite de pâtée le matin et le soir", colocation_id: friends.id)
Note.create(title: "Soirée de Noël", content: "Pensez à la déco!", colocation_id: friends.id)
Note.create(title: "Planning de ménage", content: "N'oubliez de faire le ménage quand c'est votre tour (voir planning)", colocation_id: friends.id)
Note.create(title: "Bug de la TV", content: "Quand la télé ne veux pas s'allumer, mettez-lui un coup de boule et rallumez-la !", colocation_id: friends.id)
Note.create(title: "Anniv de Rachel", content: "Le 10 décembre !!", colocation_id: friends.id)

listenoel = List.create(title: "Dîner de Noël", colocation_id: friends.id)
Item.create(name:"Bûche", list_id: listenoel.id)
Item.create(name:"Vin rouge", list_id: listenoel.id)
Item.create(name:"Guirlandes", list_id: listenoel.id)
Item.create(name:"Huîtres", list_id: listenoel.id)
Item.create(name:"Champagne", list_id: listenoel.id)
Item.create(name:"Marrons", list_id: listenoel.id)
listecourses = List.create(title: "Courses", colocation_id: friends.id)
Item.create(name:"Pain", list_id: listecourses.id)
Item.create(name:"Lait", list_id: listecourses.id)
Item.create(name:"Oeufs", list_id: listecourses.id)
Item.create(name:"Pâtes", list_id: listecourses.id)
Item.create(name:"Gruyère rapé", list_id: listecourses.id)
Item.create(name:"Crème fraîche", list_id: listecourses.id)
listetravaux = List.create(title: "Travaux Salle de Bains", colocation_id: friends.id)
Item.create(name:"Enduit", list_id: listetravaux.id)
Item.create(name:"Silicone", list_id: listetravaux.id)
Item.create(name:"éponges magiques", list_id: listetravaux.id)
Item.create(name:"Peinture blanche", list_id: listetravaux.id)
Item.create(name:"Mèche perceuse", list_id: listetravaux.id)
Item.create(name:"Clous", list_id: listetravaux.id)
listemenage = List.create(title: "Ménage de printemps", colocation_id: friends.id)
Item.create(name:"Aspirateur", description: "Partout!", list_id: listemenage.id)
Item.create(name:"SDB et toilettes", list_id: listemenage.id)
Item.create(name:"Serpillère", description: "savon noir sous l'évier", list_id: listemenage.id)
Item.create(name:"Poussière", list_id: listemenage.id)
Item.create(name:"Vitres salon", list_id: listemenage.id)
Item.create(name:"Evier au vinaigre blanc", list_id: listemenage.id)
