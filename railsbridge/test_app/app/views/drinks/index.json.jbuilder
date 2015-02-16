json.array!(@drinks) do |drink|
  json.extract! drink, :id, :name, :string, :temperature
  json.url drink_url(drink, format: :json)
end
