def create_comments(commentable, count = 2)
  count.times do 
    text = Faker::Lovecraft.paragraph
    commentable.comments.create! body: text
    puts "CREATED COMMETS: #{text}"
  end
end

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

users = [1..5].to_a.map do
  User.create! email: Faker::Internet.email,
              password: '12345678',
              password_confirmation: '12345678',
              nickname: Faker::StarTrek.character
end

10.times do |i|
  post = users.sample.posts.create! title: Faker::StarWars.character, body: Faker::StarWars.quote
  puts "CREATED POSTS: #{i.next}" if post.valid?
  create_comments post
end
