class SeriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :license, :race_type, :cars, :created_at
  has_many :series_tracks
end
