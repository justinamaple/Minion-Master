# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
justin = Account.create(email: "justinamaple@gmail.com", password: "asdf")
justin.create_inventory
joe = justin.characters.create(name: "Joe", level: 1, race: "Human")
joe.create_equipment
jenny = justin.characters.create(name: "Jenny", level: 1, race: "Human", gender: "Female")
jenny.create_equipment
ham = justin.characters.create(name: "Ham", level: 1, race: "Plant", gender: "Other")
ham.create_equipment
