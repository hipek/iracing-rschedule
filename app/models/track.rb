class Track < ApplicationRecord
  class << self
    def find_or_create(key, name)
      where(key: key).first_or_create do |track|
        track.name = name
      end
    end
  end
end
