class SeriesTrackSerializer < ActiveModel::Serializer
  attributes :id, :week, :date, :duration, :name, :time_of_day
end
