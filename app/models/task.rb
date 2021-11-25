class Task < ApplicationRecord
    belongs_to :project
    has_many :sub_tasks
    has_many :comments
    has_many :attachments
end
