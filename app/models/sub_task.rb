class SubTask < ApplicationRecord
    belongs_to :task
    validates :title, presence: true
    validates :status, presence: true
end
