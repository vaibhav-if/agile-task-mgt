class Phase < ApplicationRecord
    has_many :phasings
    has_many :projects, through: :phasings
    validates :title, presence: true, uniqueness: true
end
