class Series < ApplicationRecord
  has_many :series_tracks, dependent: :destroy
  serialize :cars, JSON

  default_scope { order(race_type: :desc, license: :desc) }
end
