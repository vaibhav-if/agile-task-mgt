class Project < ApplicationRecord
    has_rich_text :description
    has_many :tasks, dependent: :destroy
end
