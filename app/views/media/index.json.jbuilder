json.array!(@media) do |medium|
  json.extract! medium, :name, :description, :address
  json.url medium_url(medium, format: :json)
end
