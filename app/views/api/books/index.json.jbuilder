json.books do
  json.array!(@books) do |book|
    json.partial!(book)
    json.status(book.status)
    json.image_url(book.image_url)
  end
end
json.total_count(@total_count)
json.total_page(@total_page)
json.offset(@offset)
