class Series < ApplicationRecord
  has_many :series_tracks, dependent: :destroy
  serialize :cars, JSON
end
