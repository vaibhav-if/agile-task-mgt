require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'validation tests' do 
    let(:project) { Project.new } 
    let(:user) { User.create!(email: "abcd@abcd.com", password: "123456") }

    it 'ensures title presence' do 
      project.title = nil
      expect(project.save).to eq(false)
    end

    it 'ensures status presence' do 
      project.status = nil
      expect(project.save).to eq(false)
    end

    it 'ensures due date presence' do 
      project.due_date = nil
      expect(project.save).to eq(false)
    end

    it 'ensures phases presence' do 
      project.all_phases = nil
      expect(project.save).to eq(false)
    end

    it 'should save successfully' do
      project.title = "Rails"
      project.status = "Todo"
      project.due_date = "15/11/2021"
      project.all_phases = "Todo, Completed"
      project.user_id = user.id
      expect(project.save!).to eq(true)
    end
  end
end
