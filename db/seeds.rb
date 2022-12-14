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
file_rachel = URI.open("https://media-exp1.licdn.com/dms/image/C4E03AQHpKu3f3yMmgQ/profile-displayphoto-shrink_800_800/0/1516545530384?e=1675900800&v=beta&t=19MguSf0CGZm4IUx2bszertVQNVdSfbhCxLedPSsalE")
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
Note.create(title: "Mot de passe wifi", content: "Asx@l597#ffeDCzP2", colocation_id: friends.id)
Note.create(title: "Num??ro du proprio", content: "0783407855", colocation_id: friends.id)
Note.create(title: "Contact du plombier", content: "Many et ses outils: 0783407855", colocation_id: friends.id)

# puts "create messages..."
# Message.create(chatroom_id: chatroom.id, user_id: joey.id, content: "Bonjour la coloc' !!!")
# Message.create(chatroom_id: chatroom.id, user_id: ross.id, content: "Salut Jo !")
# Message.create(chatroom_id: chatroom.id, user_id: monica.id, content: "Bonjour les gars !")
# Message.create(chatroom_id: chatroom.id, user_id: joey.id, content: "Comment allez-vous ?")
# Message.create(chatroom_id: chatroom.id, user_id: ross.id, content: "Tout roule et toi ?")
# Message.create(chatroom_id: chatroom.id, user_id: joey.id, content: "Rachel n'est pas l?? ?")
# Message.create(chatroom_id: chatroom.id, user_id: rachel.id, content: "Si si je suis l?? ! Tout le monde va bien ?")
# Message.create(chatroom_id: chatroom.id, user_id: monica.id, content: "Oui, h??te de finir le travail !")
# Message.create(chatroom_id: chatroom.id, user_id: joey.id, content: "P'tite bi??re ?")
# Message.create(chatroom_id: chatroom.id, user_id: ross.id, content: "Je suis partant !")
# Message.create(chatroom_id: chatroom.id, user_id: chandler.id, content: "Salut tout le monde ! Partant pour une bi??re aussi :D")
# Message.create(chatroom_id: chatroom.id, user_id: ross.id, content: "On se retrouve au caf?? ? Comme d'hab ? ")

Note.create(title: "Le chat", content: "N'oubliez pas de nourrir le chat, une boite de p??t??e le matin et le soir", colocation_id: friends.id)
Note.create(title: "Soir??e de No??l", content: "Pensez ?? la d??co!", colocation_id: friends.id)
Note.create(title: "Planning de m??nage", content: "N'oubliez de faire le m??nage quand c'est votre tour (voir planning)", colocation_id: friends.id)
Note.create(title: "Bug de la TV", content: "Quand la t??l?? ne veux pas s'allumer, mettez-lui un coup de boule et rallumez-la !", colocation_id: friends.id)
Note.create(title: "Anniv de Rachel", content: "Le 10 d??cembre !!", colocation_id: friends.id)

listenoel = List.create(title: "D??ner de No??l", colocation_id: friends.id)
Item.create(name:"B??che", list_id: listenoel.id)
Item.create(name:"Vin rouge", list_id: listenoel.id)
Item.create(name:"Guirlandes", list_id: listenoel.id)
Item.create(name:"Hu??tres", list_id: listenoel.id)
Item.create(name:"Champagne", list_id: listenoel.id)
Item.create(name:"Marrons", list_id: listenoel.id)
listecourses = List.create(title: "Courses", colocation_id: friends.id)
Item.create(name:"Pain", list_id: listecourses.id)
Item.create(name:"Lait", list_id: listecourses.id)
Item.create(name:"Oeufs", list_id: listecourses.id)
Item.create(name:"P??tes", list_id: listecourses.id)
Item.create(name:"Gruy??re rap??", list_id: listecourses.id)
Item.create(name:"Cr??me fra??che", list_id: listecourses.id)
listetravaux = List.create(title: "Travaux Salle de Bains", colocation_id: friends.id)
Item.create(name:"Enduit", list_id: listetravaux.id)
Item.create(name:"Silicone", list_id: listetravaux.id)
Item.create(name:"??ponges magiques", list_id: listetravaux.id)
Item.create(name:"Peinture blanche", list_id: listetravaux.id)
Item.create(name:"M??che perceuse", list_id: listetravaux.id)
Item.create(name:"Clous", list_id: listetravaux.id)
listemenage = List.create(title: "M??nage de printemps", colocation_id: friends.id)
Item.create(name:"Aspirateur", description: "Partout!", list_id: listemenage.id)
Item.create(name:"SDB et toilettes", list_id: listemenage.id)
Item.create(name:"Serpill??re", description: "savon noir sous l'??vier", list_id: listemenage.id)
Item.create(name:"Poussi??re", list_id: listemenage.id)
Item.create(name:"Vitres salon", list_id: listemenage.id)
Item.create(name:"Evier au vinaigre blanc", list_id: listemenage.id)
puts "all done"
