class SeriesTrack < ApplicationRecord
  belongs_to :track
  belongs_to :series
end
