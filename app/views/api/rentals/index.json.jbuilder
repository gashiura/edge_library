json.rentals do
  json.array!(@rentals) do |rental|
    json.partial!(rental)
  end
end
