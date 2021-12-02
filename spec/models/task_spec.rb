require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'validation tests' do 
    let(:task) { Task.new }
    let(:phase) { Phase.create(title: "Todo") } 
    let(:user) { User.create!(email: "abcd@abcd.com", password: "123456") }
    let(:project) { Project.create!(title: "Rails", status: "In-rogress", due_date: "20/12/2021", all_phases: "ToDo, In-progress, Completed", user_id: user.id) } 

    it 'ensures title presence' do 
      task.title = nil
      expect(task.save).to eq(false)
    end

    it 'ensures story point presence' do 
      task.story_point = nil
      expect(task.save).to eq(false)
    end

    it 'ensures priority presence' do 
      task.priority = nil
      expect(task.save).to eq(false)
    end

    it 'ensures due date presence' do 
      task.due_date = nil
      expect(task.save).to eq(false)
    end

    it 'ensures status presence' do 
      task.status = nil
      expect(task.save).to eq(false)
    end

    it 'ensures phases presence' do 
      task.phase_id = nil
      expect(task.save).to eq(false)
    end

    it 'should save successfully' do
      task.title = "Rails task"
      task.story_point = 2
      task.priority = "Low"
      task.due_date = "15/11/2021"
      task.status = "In-progress"
      task.project_id = project.id
      task.user_id = user.id
      task.phase_id = phase.id
      expect(task.save!).to eq(true)
    end
  end
end
