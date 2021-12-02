class Project < ApplicationRecord
    # has_rich_text :description
    has_many :tasks, dependent: :destroy
    belongs_to :user
    has_many :phasings
    has_many :phases, through: :phasings
    validates :title, presence: true
    validates :status, presence: true
    validates :due_date, presence: true
    validates :phases, presence: true

    def all_phases=(text)
        if text.blank?
            return
        end
        self.phases = text.split(",").map do |title|
            unless title.blank?
                Phase.where(title: title.strip).first_or_create!
            end
        end
    end
  
    def all_phases
        phases.map(&:title).join(", ")
    end
end
