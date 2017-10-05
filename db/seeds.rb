# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

10.times do |i|
  post = user.posts.create! title: Faker::StarWars.character, body: Faker::StarWars.quote
  puts "CREATED POSTS: #{i.next}" if post.valid?
end
