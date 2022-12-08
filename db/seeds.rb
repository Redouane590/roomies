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
chatroom = Chatroom.create!(colocation_id: friends.id)
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
file_phoebe = URI.open("https://static.wikia.nocookie.net/friends/images/7/79/Phoebe.jpg/revision/latest/scale-to-width-down/180?cb=20120326154329&path-prefix=fr")
phoebe = User.create!(email: "phoebe@mail.fr", nickname: "Phoebe", password: "azerty", phone_number: "0738013744")
phoebe.photo.attach(io: file_phoebe, filename: "Joey.jpg", content_type: "image/jpg")
phoebe.save
puts "usercoloc creation.."
UserColocation.create!(colocation_id: friends.id, user_id: joey.id)
UserColocation.create!(colocation_id: friends.id, user_id: rachel.id)
UserColocation.create!(colocation_id: friends.id, user_id: ross.id)
UserColocation.create!(colocation_id: friends.id, user_id: chandler.id)
UserColocation.create!(colocation_id: friends.id, user_id: monica.id)
puts "create notes..."
Note.create(title: "Mot de passe wifi", content: "Asx@l597#ffez", colocation_id: friends.id)
Note.create(title: "Numero du proprio", content: "0783407855", colocation_id: friends.id)
Note.create(title: "Contact du plombier", content: "Many et ses outils: 0783407855", colocation_id: friends.id)
Note.create(title: "Le chat", content: "N'oublier pas de nourrir le chat, un paquet au matin et un au soir", colocation_id: friends.id)
Note.create(title: "Soirée de noel", content: "Oubliez pas les preparatifs de noel", colocation_id: friends.id)
Note.create(title: "Planning de menage", content: "N'oubliez de faire le ménage quand c'est votre tour (voir planning)", colocation_id: friends.id)
Note.create(title: "Bug de la TV", content: "Quand la télé ne veux pas s'allumer mettez lui un coup de boule et rallumez la !", colocation_id: friends.id)
Note.create(title: "Anniv de rachel", content: "Le 10 décembre !!", colocation_id: friends.id)
puts "create messages..."
Message.create(chatroom_id: chatroom.id, user_id: joey.id, content: "Bonjour la coloc' !!!")
Message.create(chatroom_id: chatroom.id, user_id: ross.id, content: "Salut Jo !")
Message.create(chatroom_id: chatroom.id, user_id: monica.id, content: "Bonjour les gars !")
Message.create(chatroom_id: chatroom.id, user_id: joey.id, content: "Comment allez-vous ?")
Message.create(chatroom_id: chatroom.id, user_id: ross.id, content: "Tout roule et toi ?")
Message.create(chatroom_id: chatroom.id, user_id: joey.id, content: "Rachel n'est pas là ?")
Message.create(chatroom_id: chatroom.id, user_id: rachel.id, content: "Si si je suis là ! Tout le monde va bien ?")
Message.create(chatroom_id: chatroom.id, user_id: monica.id, content: "Oui, hâte de finir le travail !")
Message.create(chatroom_id: chatroom.id, user_id: joey.id, content: "P'tite bière ?")
Message.create(chatroom_id: chatroom.id, user_id: ross.id, content: "Je suis partant !")
Message.create(chatroom_id: chatroom.id, user_id: chandler.id, content: "Salut tout le monde ! Partant pour une bière aussi :D")
Message.create(chatroom_id: chatroom.id, user_id: ross.id, content: "On se retrouve au café ? Comme d'hab ? ")
puts "all done"
