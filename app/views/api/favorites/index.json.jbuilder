json.favorites do
  json.array!(@favorites) do |favorite|
    json.partial!(favorite)
  end
end
