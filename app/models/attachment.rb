class Attachment < ApplicationRecord
    belongs_to :task
    has_many_attached :uploads
end
