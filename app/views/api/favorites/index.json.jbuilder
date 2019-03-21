json.favorites do
  json.array!(@favorites) do |favorite|
    json.partial!(favorite)
    json.book_name(favorite.book.name)
    json.image_url(favorite.book.image_url)
  end
end
