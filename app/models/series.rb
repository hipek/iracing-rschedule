class Series < ApplicationRecord
  has_many :series_tracks
  serialize :cars, JSON
end
