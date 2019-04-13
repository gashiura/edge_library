json.rental do
  json.partial!(@rental)
  json.book_name(@rental.book.name)
  json.overdue(@rental.overdue)
end
