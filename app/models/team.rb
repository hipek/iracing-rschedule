class Team < ApplicationRecord
  has_many :team_members
  validates :name, :slug, presence: true
end
