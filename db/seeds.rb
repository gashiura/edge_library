# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [
  {
    name: 'higashiura',
    email: 'gasi3319@yahoo.co.jp',
    password: 'password',
    authority: 1
  },
  {
    name: 'gashiura',
    email: 'gashiura33@yahoo.co.jp',
    password: 'password',
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

books = [
  {
    id: 1,
    eg_id: "EG000001",
    name: "[試して理解]Linuxのしくみ ~実験と図解で学ぶOSとハードウェアの基礎知識",
    author: '武内 覚',
    description: 'いまどきのOSのしくみが、実験と図解でわかる!',
    publisher: '技術評論社',
    category: '技術書',
    tags: { tags: ['OS', 'Linux'] },
    image_path: '../../../assets/images/books/001.jpeg',
    quantity: 1
  },
  {
    id: 2,
    eg_id: "EG000002",
    name: "実践ハイパフォーマンスMySQL 第3版",
    author: 'Baron Schwartz (著), Peter Zaitsev (著), Vadim Tkachenko (著), 菊池 研自 (監修), 株式会社クイープ (翻訳)',
    description: '新しい情報を盛り込み、信頼性や正確さといった目標を重視するという前版からの方針に加えて、\n第3版では、MySQLの動作の仕組みに関する事実だけでなく、MySQLがそのように動作する原理を伝えたいと考えて執筆されています。',
    publisher: 'オライリージャパン',
    category: '技術書',
    tags: { tags: ['RDB','MySQL'] },
    image_path: '../../../assets/images/books/002.jpeg',
    quantity: 1
  },
  {
    id: 3,
    eg_id: "EG000003",
    name: "オブジェクト指向設計実践ガイド ~Rubyでわかる 進化しつづける柔軟なアプリケーションの育て方",
    author: 'Sandi Metz (著), 髙山 泰基  (翻訳)',
    description: 'オブジェクト指向設計の名著として名高い“Practical Object-Oriented Design in Ruby"、待望の翻訳版! 使いこなせるようになるととても便利なオブジェクト指向ですが、「なんとなく」の理解で使っていると、大きな罠にかかってしまいます。本書は、保守性を上げて運用コストを下げるアプリケーションをつくるために、クラス設計から基本概念、継承のテクニック、ダックタイプ、そしてテスト設計まで、幅広くカバーしています。オブジェクト指向言語を使用するすべての人におすすめの1冊です。',
    publisher: '技術評論社',
    category: '技術書',
    tags: { tags: ['Ruby', 'オブジェクト指向'] },
    image_path: '../../../assets/images/books/003.jpeg',
    quantity: 1
  }
]

for book in books do
  Book.create(
    eg_id: book[:eg_id],
    name: book[:name],
    author: book[:author],
    description: book[:description],
    publisher: book[:publisher],
    category: book[:category],
    tags: book[:tags],
    image_path: book[:image_path],
    quantity: book[:quantity]
  )
end

rentals = [
  {
    book_id: 1,
    user_id: 1,
    status: '返却済',
    checkout_date: '2019-02-16 12:31:22',
    checkout_approver: '片岡',
    return_due_date: '2019-02-23 00:00:00',
    return_date: '2019-02-22 12:31:22',
    return_approver: '早坂'
  },
  {
    book_id: 2,
    user_id: 1,
    status: '貸出中',
    checkout_date: '2019-03-01 12:31:22',
    checkout_approver: '片岡',
    return_due_date: '2019-03-15 12:31:22',
    return_date: nil,
    return_approver: nil
  },
  {
    book_id: 3,
    user_id: 1,
    status: '貸出中',
    checkout_date: '2019-03-01 12:31:22',
    checkout_approver: '西宮',
    return_due_date: '2019-03-05 12:31:22',
    return_date: nil,
    return_approver: nil
  }
]

for rental in rentals
  Rental.create(
    book_id: rental[:book_id],
    user_id: rental[:user_id],
    status: rental[:status],
    checkout_date: rental[:checkout_date],
    checkout_approver: rental[:checkout_approver],
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
    content: 'まあ普通ですね。読みたい人は読めばいいと思います。',
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
