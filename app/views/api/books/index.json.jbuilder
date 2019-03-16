json.books do
  json.array!(@books) do |book|
    json.partial!(book)
  end
end
