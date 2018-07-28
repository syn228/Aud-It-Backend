# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

aaron = User.create(username: "aarongy", password:"a", first_name:"aaron", last_name:"na")

file1 = Convertedfile.create(name: "my doc!", user_id: User.first.id, text: "WOW")
file2 = Convertedfile.create(name: "my doc2!", user_id: User.first.id, text: "this is a longer example that I would like to test with moving forward")

upload1 = Upload.create(name: "filename", path: "/good/path")