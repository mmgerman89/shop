json.array!(@commerces) do |commerce|
  json.extract! commerce, :id, :name, :user_id
  json.url commerce_url(commerce, format: :json)
end
