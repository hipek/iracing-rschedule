class Team < ApplicationRecord
  validates :name, :slug, presence: true
end
