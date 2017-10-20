def create_comments(commentable, count = 2)
  count.times do
    commentable.comments.create! body: text
  end
end

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

users = (1..5).to_a.map do
  user = User.create! email: Faker::Internet.email,
              password: '12345678',
              password_confirmation: '12345678',
              nickname: Faker::StarTrek.character
  puts 'CREATED USER: ' << user.email
  user
end

100.times do |i|
  post = users.sample.posts.create! title: Faker::StarWars.character,
                                    body: Faker::StarWars.quote,
                                    published_at: Date.today - rand(100)

  puts 'CREATED POSTS' if post.valid?
end

Post.all.each do |p|
  text = Faker::Lovecraft.paragraph
  User.order("RANDOM()").first.comments.create commentable: p, body: text, published_at: p.published_at.to_date + rand(10)
  puts 'CREATED COMMETS'
end
