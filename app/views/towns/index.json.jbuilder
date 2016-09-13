json.array!(@towns) do |town|
  json.extract! town, :id, :name, :code
  json.url town_url(town, format: :json)
end
