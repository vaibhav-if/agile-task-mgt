class Project < ApplicationRecord
    # has_rich_text :description
    has_many :tasks, dependent: :destroy
    belongs_to :user
    validates :title, presence: true
    validates :status, presence: true
    validates :due_date, presence: true
    validates :phases, presence: true

    # def phases=(title)
    #     if title.blank?
    #         return
    #     end
    #     self.phases = title.split(",").map do |title|
    #         unless title.blank?
    #             Phase.where(title: title.strip).first_or_create!
    #         end
    #     end
    # end
  
    # def phases
    #     phases.map(&:title).join(", ")
    # end
end
