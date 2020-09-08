# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'json'

[
  User.new(uid: 'higashiura', email: 'aaa@example.com', password: 'password', authority: 1),
  User.new(uid: 'gashiura', email: 'bbb@example.com', password: 'password', authority: 2)
].each do |user|
  user.save
end

CSV.foreach(Rails.root.join('db', 'seeds', 'books.csv'), headers: true) do |book|
  Book.create(
    name: book[1],
    eg_id: book[2],
    author: book[3],
    description: book[4].gsub('\n', "\n"),
    publisher: book[5],
    category: book[6],
    tags: { tags: book[7].split("\s") }.to_json,
    quantity: book[8]
  )
end

[
  Rental.new(
    book_id: 1,
    user_id: 1,
    checkout_date: '2019-02-16 12:31:22',
    return_due_date: '2019-02-23 00:00:00',
    return_date: '2019-02-22 12:31:22',
    return_approver: '山田'
  ),
  Rental.new(
    book_id: 2,
    user_id: 1,
    checkout_date: '2019-03-01 12:31:22',
    return_due_date: '2019-03-15 12:31:22',
    return_date: nil,
    return_approver: nil
  ),
  Rental.new(
    book_id: 3,
    user_id: 1,
    checkout_date: '2019-03-01 12:31:22',
    return_due_date: '2019-03-05 12:31:22',
    return_date: nil,
    return_approver: nil
  )
].each do |rental|
  rental.save
end

[
  Review.new(
    id: 1,
    book_id: 1,
    user_id: 1,
    content: 'linux初心者が、内部の動作について学ぶのに最適です。この本を読むことで、理解が一段階深まった気がします！',
    point: 5
  ),
  Review.new(
    id: 2,
    book_id: 1,
    user_id: 2,
    content: "まあ普通ですね。\n読みたい人は読めばいいと思います。",
    point: 3
  ),
].each do |review|
  review.save
end

[
  Favorite.new(id: 1, book_id: 1, user_id: 1),
  Favorite.new(id: 2, book_id: 2, user_id: 2)
].each do |favorite|
  favorite.save
end
