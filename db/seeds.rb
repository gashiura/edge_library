# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'digest/sha2'
require 'json'

password = Digest::SHA256.hexdigest 'password'
users = [
  {
    name: 'higashiura',
    email: 'gasi3319@yahoo.co.jp',
    password: password,
    authority: 1
  },
  {
    name: 'gashiura',
    email: 'gashiura33@yahoo.co.jp',
    password: password,
    authority: 2
  }
]

for user in users
  User.create(
    name: user[:name],
    email: user[:email],
    password: user[:password],
    authority: user[:authority]
  )
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

rentals = [
  {
    book_id: 1,
    user_id: 1,
    checkout_date: '2019-02-16 12:31:22',
    return_due_date: '2019-02-23 00:00:00',
    return_date: '2019-02-22 12:31:22',
    return_approver: '早坂'
  },
  {
    book_id: 2,
    user_id: 1,
    checkout_date: '2019-03-01 12:31:22',
    return_due_date: '2019-03-15 12:31:22',
    return_date: nil,
    return_approver: nil
  },
  {
    book_id: 3,
    user_id: 1,
    checkout_date: '2019-03-01 12:31:22',
    return_due_date: '2019-03-05 12:31:22',
    return_date: nil,
    return_approver: nil
  }
]

for rental in rentals
  Rental.create(
    book_id: rental[:book_id],
    user_id: rental[:user_id],
    checkout_date: rental[:checkout_date],
    return_due_date: rental[:return_due_date],
    return_date: rental[:return_date],
    return_approver: rental[:return_approver]
  )
end

reviews = [
  {
    id: 1,
    book_id: 1,
    user_id: 1,
    content: 'linux初心者が、内部の動作について学ぶのに最適です。この本を読むことで、理解が一段階深まった気がします！',
    point: 5,
    createdAt: '2019/03/01 19:42:21',
    updatedAt: '2019/03/01 19:42:21'
  },
  {
    id: 2,
    book_id: 1,
    user_id: 2,
    content: "まあ普通ですね。\n読みたい人は読めばいいと思います。",
    point: 3,
    createdAt: '2019/03/07 10:13:01',
    updatedAt: '2019/03/07 10:13:01'
  },
]

for review in reviews
  Review.create(
    id: review[:id],
    book_id: review[:book_id],
    user_id: review[:user_id],
    content: review[:content],
    point: review[:point]
  )
end

favorites = [
  {
    id: 1,
    book_id: 1,
    user_id: 1
  },
  {
    id: 2,
    book_id: 2,
    user_id: 2
  }
]

for favorite in favorites
  Favorite.create(
    book_id: favorite[:book_id],
    user_id: favorite[:user_id]
  )
end
