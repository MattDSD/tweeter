User.delete_all
Tweet.delete_all

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    password: Faker::Commerce.color,
    email: Faker::Internet.email,
    about: Faker::Lorem.sentence,
    location: Faker::Address.city)
end

20.times do
  Tweet.create(
    content: Faker::Lorem.sentence,
    user_id: rand(10)+1,
    retweet: false
  )
end

30.times do
  Following.create(following_id: rand(10) + 1, follower_id: rand(10) +1)
end
