class Phase < ApplicationRecord
    validates :title, presence: true, uniqueness: true
end
