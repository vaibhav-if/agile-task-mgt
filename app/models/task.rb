class Task < ApplicationRecord
    belongs_to :project
    belongs_to :phase
    has_many :sub_tasks, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :attachments, dependent: :destroy
end
