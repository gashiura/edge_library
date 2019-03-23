json.rentals do
  json.array!(@rentals) do |rental|
    json.partial!(rental)
    json.eg_id(rental.book.eg_id)
    json.book_name(rental.book.name)
    json.overdue(rental.overdue)
    json.book_url(rental.book_url)
  end
end
