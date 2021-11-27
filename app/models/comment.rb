class Comment < ApplicationRecord
    belongs_to :task
    belongs_to :user
    # has_rich_text :description
end
