class Season < ApplicationRecord
  has_many :series, dependent: :destroy
end
