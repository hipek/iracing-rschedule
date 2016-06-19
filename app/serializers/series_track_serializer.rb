class SeriesTrackSerializer < ActiveModel::Serializer
  attributes :id, :week, :date, :duration, :name, :time_of_day, :created_at
end
