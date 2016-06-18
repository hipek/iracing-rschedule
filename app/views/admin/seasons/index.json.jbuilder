json.array!(@seasons) do |season|
  json.extract! season, :id, :name, :active_from, :active_to
  json.url season_url(season, format: :json)
end
