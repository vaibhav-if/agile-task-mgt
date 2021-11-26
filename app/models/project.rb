class Project < ApplicationRecord
    # has_rich_text :description
    has_many :tasks, dependent: :destroy
    belongs_to :user
    validates :title, presence: true
    validates :status, presence: true
    validates :due_date, presence: true
end
