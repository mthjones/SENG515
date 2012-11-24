# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Workshop.delete_all
(1..100).each do |num|
	Workshop.create!(title: (0...15).map{ (('a'..'z').to_a + ('A'..'Z').to_a + [' ']*10).to_a[rand(62)] }.join, description: (0...200).map{ (('a'..'z').to_a + ('A'..'Z').to_a + [' ']*10).to_a[rand(62)] }.join, start_date: Date.today, end_date: Date.today + 21.days)
end
