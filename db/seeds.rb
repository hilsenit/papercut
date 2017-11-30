# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Theme.destroy_all

Theme.create!([
  title: "Hvorfor snakker vi ikke om lort",
  description: "Lang tekst om hvorfor vi ikke gør det.",
  made_by: "This one"
])

p "#{Theme.all.count} created"
