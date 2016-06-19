class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :name, :active_from, :active_to, :created_at
  has_many :series
end
