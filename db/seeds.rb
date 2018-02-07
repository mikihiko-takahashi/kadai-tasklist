# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..100).each do |number|
  Task.create(status: 'status ' + number.to_s, content: 'task ' + number.to_s)
end

#Task.create(status: 'status 1', content: 'task 1')
#Task.create(status: 'status 2', content: 'task 2')
#Task.create(status: 'status 3', content: 'task 3')
