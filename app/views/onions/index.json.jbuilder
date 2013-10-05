json.array!(@onions) do |onion|
  json.extract! onion, :title, :name, :url, :description
  json.url onion_url(onion, format: :json)
end
