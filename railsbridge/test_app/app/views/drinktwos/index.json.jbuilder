json.array!(@drinktwos) do |drinktwo|
  json.extract! drinktwo, :id, :name, :temperature
  json.url drinktwo_url(drinktwo, format: :json)
end
