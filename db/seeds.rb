# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Notification.delete_all
Message.delete_all
Visitor.delete_all
Comment.delete_all
PostTag.delete_all
Tag.delete_all
Post.delete_all
#Moderator.delete_all

moderator = Moderator.find_or_initialize_by(fullname: 'Test Blog', username: 'test@mail.com')

if moderator.new_record?
  moderator.password = 'password'
  moderator.save
end


30.times do
  post = Post.create( title: Faker::Lorem.sentence(20),
                 content: Faker::Lorem.paragraph,
                 publish: true,
                 moderator: moderator)

  tag = Tag.create(name: Faker::Lorem.word)

  post_tag = PostTag.create(post: post, tag: tag)

  visitor = Visitor.create(
      fullname: Faker::Name.name,
      email: Faker::Internet.email,
      status: [true, false].sample
  )

  comment = Comment.create(
      message: Faker::Lorem.paragraph,
      status: [true, false].sample,
      post: post,
      visitor: visitor)

  message = Message.create(
    content: Faker::Lorem.paragraph,
    status: [true, false].sample,
    visitor: visitor)

  notifiable = [visitor, comment].sample

  notification = Notification.create(
      notifiable: notifiable
  )
end

