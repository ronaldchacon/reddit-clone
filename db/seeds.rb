100.times do
  User.create(
    email: Faker::Internet.email, password: 'foobar',
    password_confirmation: 'foobar', username: Faker::Internet.user_name
  )
end

User.all.each do |u|
  rand(1..5).times do
    u.posts.create(
      title: Faker::Hacker.say_something_smart, url: Faker::Internet.url
    )
  end
end

Post.all.each do |post|
  rand(1..5).times do
    post.comments.create(
      user_id: User.all.sample.id, body: Faker::Hacker.say_something_smart
    )
  end
end

Post.all.each do |post|
  # upvote
  rand(1..5).times do
    post.upvote_by User.all.sample
  end
  # downvote
  rand(1..5).times do
    post.downvote_by User.all.sample
  end
end

Comment.all.each do |comment|
  # upvote
  rand(1..5).times do
    comment.upvote_by User.all.sample
  end
  # downvote
  rand(1..5).times do
    comment.downvote_by User.all.sample
  end
end
