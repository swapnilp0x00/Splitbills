# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
arr = ["Amar","Akbar","Anthany"]
3.times do |t|
  User.create(name:"#{arr[t]}", email: "#{arr[t].downcase}@gmail.com" , password:"hello1234")
end
p "All users created"
