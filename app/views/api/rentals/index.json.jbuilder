json.rentals do
  json.array!(@rentals) do |rental|
    json.partial!(rental)
    json.eg_id(rental.book.eg_id)
    json.book_name(rental.book.name)
  end
end
