class TeamMember < ApplicationRecord
  belongs_to :team

  validates :name, :short_name, :team, presence: true
end
