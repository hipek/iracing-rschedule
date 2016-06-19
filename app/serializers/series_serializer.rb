class SeriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :license, :race_type, :cars
  has_many :series_tracks
end
