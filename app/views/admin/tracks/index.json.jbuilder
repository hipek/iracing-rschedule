json.array!(@tracks) do |track|
  json.extract! track, :id, :name, :key
  json.url track_url(track, format: :json)
end
