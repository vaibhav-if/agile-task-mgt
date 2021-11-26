class Task < ApplicationRecord
    belongs_to :user
    belongs_to :project
    belongs_to :phase
    has_many :sub_tasks, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :attachments, dependent: :destroy
    validates :title, presence: true
    validates :story_point, presence: true
    validates :priority, presence: true
    validates :due_date, presence: true
    validates :status, presence: true
end
