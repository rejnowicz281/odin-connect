# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: "1@gmail.com", password: 123456)
User.create(email: "2@gmail.com", password: 123456)
User.create(email: "3@gmail.com", password: 123456)
User.create(email: "4@gmail.com", password: 123456)
User.create(email: "5@gmail.com", password: 123456)

User.first.posts.create(body: "Post 1")
User.second.posts.create(body: "Post 2")
User.third.posts.create(body: "Post 3")
User.fourth.posts.create(body: "Post 4")
User.fifth.posts.create(body: "Post 5")

Post.first.comments.create(author: User.first, body: "comment 1")
Post.first.comments.create(author: User.second, body: "comment 2")
Post.second.comments.create(author: User.third, body: "comment 3")
Post.second.comments.create(author: User.fourth, body: "comment 4")
Post.third.comments.create(author: User.fifth, body: "comment 5")
Post.third.comments.create(author: User.first, body: "comment 6")
Post.fourth.comments.create(author: User.second, body: "comment 7")
Post.fourth.comments.create(author: User.third, body: "comment 8")
Post.fifth.comments.create(author: User.fourth, body: "comment 9")
Post.fifth.comments.create(author: User.fifth, body: "comment 10")

Post.first.likes.create(user: User.first)
Post.first.likes.create(user: User.second)
Post.second.likes.create(user: User.third)
Post.second.likes.create(user: User.fourth)
Post.third.likes.create(user: User.fifth)
Post.third.likes.create(user: User.first)
Post.fourth.likes.create(user: User.second)
Post.fourth.likes.create(user: User.third)
Post.fifth.likes.create(user: User.fourth)
Post.fifth.likes.create(user: User.fifth)

Friendship.create(user: User.first, friend: User.second)
Friendship.create(user: User.first, friend: User.third)
Friendship.create(user: User.second, friend: User.third)
Friendship.create(user: User.second, friend: User.fourth)
Friendship.create(user: User.third, friend: User.fourth)
Friendship.create(user: User.third, friend: User.fifth)
Friendship.create(user: User.fourth, friend: User.first)
Friendship.create(user: User.fourth, friend: User.fifth)