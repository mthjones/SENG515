# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Room.delete_all
Workshop.delete_all
Session.delete_all
Room.delete_all
Equipment.delete_all

EQUIPMENT = [
  { name: "Projector", description: Faker::Lorem.sentence(rand(5..20)) },
  { name: "TV", description: Faker::Lorem.sentence(rand(5..20)) },
  { name: "VCR", description: Faker::Lorem.sentence(rand(5..20)) },
  { name: "DVD Player", description: Faker::Lorem.sentence(rand(5..20)) },
  { name: "Blu-ray Player", description: Faker::Lorem.sentence(rand(5..20)) },
  { name: "Conference Table", description: Faker::Lorem.sentence(rand(5..20)) },
  { name: "Microphone", description: Faker::Lorem.sentence(rand(5..20)) }
]

puts "Creating equipment..."

EQUIPMENT.each do |e|
  e = Equipment.new({
    name: e[:name],
    description: e[:description]
  })
  
  if e.save
    puts "\tCreated equipment: #{e.name}"
  else
    puts "\tCouldn't create equipment: #{e.name}"
  end
end

all_equipment = Equipment.all

puts "Creating rooms..."
LOCATIONS = []
20.times do |l_num|
  LOCATIONS.push(Faker::Address.street_address())
end

200.times do |r_num|
  room = Room.new({
    room_no: Faker::Address.building_number(),
    location: LOCATIONS[rand(LOCATIONS.length)]
  })
  
  e_count = rand(all_equipment.length)
  puts "\tAdding equipment to room..."
  (1..e_count).each do |e_num|
    e = all_equipment.sample
    room.equipment += [e]
    puts "\t\tAdded #{e.name} to room."
  end
  
  if room.save
    puts "\tCreated room: #{room.room_no} #{room.location}"
  else
    puts "\tCouldn't create room: #{room.room_no} #{room.location}"
  end
end

all_rooms = Room.all

puts "Creating workshops..."
50.times do |w_num|
	workshop = Workshop.new({
    title: Faker::Lorem.words(rand(3..10)).join(" ").titleize, 
    description: Faker::Lorem.paragraphs(rand(3..10)).join(" "), 
    start_date: Date.today, 
    end_date: Date.today + rand(21).days
  })
  
  puts "\tAdding sessions to workshop..."
  rand(5..25).times do |s_num|
    start_datetime = Time.at(workshop.start_date.to_time + rand * (workshop.end_date.to_time.to_f - workshop.start_date.to_time.to_f)).to_datetime
    end_datetime = Time.at(start_datetime.to_time + rand * ((start_datetime + 8.hours).to_f - start_datetime.to_time.to_f)).to_datetime + 15.minutes
    
    session = Session.new({
      title: Faker::Lorem.words(rand(2..8)).join(" ").titleize,
      description: Faker::Lorem.sentences(rand(5..20)).join(" "),
      start_datetime: start_datetime,
      end_datetime: end_datetime
      })
    
    session.workshop = workshop
    
    rooms_checked = 1
    session.room = all_rooms.sample
    while (session.invalid? && rooms_checked < all_rooms.length)
      session.room = all_rooms.sample
      rooms_checked += 1
    end
    
    if rooms_checked >= all_rooms.length
      puts "\t\tNo rooms available for session."
    else
      if session.save
        puts "\t\tCreated session: #{session.title}"
      else
        puts "\t\tCouldn't create session: #{session.title}"
      end
    end
  end
  
  if workshop.save
    puts "\tCreated workshop: #{workshop.title}"
  else
    puts "\tCouldn't create workshop: #{workshop.title}"
  end
end

puts "Creating blog posts..."
50.times do |b_num|
  post = Post.new({
    title: Faker::Lorem.words(rand(2..8)).join(" ").titleize,
    content: Faker::Lorem.paragraphs(rand(10..30)).join(" ")
    })
  
  if post.save
    puts "\tCreated post: #{post.title}"
  else
    puts "\tCouldn't create post: #{post.title}"
  end
end

if User.count == 0
  puts "Creating administrator user..."
  User.create!(email: "admin@admin.com", password: "admin")
  puts "\tEmail: admin@admin.com"
  puts "\tPassword: admin"
end

puts "Finished seeding!"