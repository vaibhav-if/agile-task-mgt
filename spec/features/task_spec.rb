require 'rails_helper'

def create_new_project_for_task_helper
  login_and_logout_with_warden do
    visit("/projects")
    click_link('Create new project')
    fill_in 'Title', with: 'Rails'
    fill_in 'Description', with: 'Some description regarding rails'
    fill_in 'Due date', with: '15/12/2021'
    fill_in 'Phases', with: 'Todo, In-progress, Completed'
    click_button('Submit')
    click_link('Show Tasks')
    yield
  end
end

def create_task_helper
  create_new_project_for_task_helper do
    click_link('Create new task')
    fill_in 'Title', with: 'Rails task 1'
    fill_in 'Description', with: 'Some description regarding rails task'
    fill_in 'Story point', with: '2'
    fill_in 'Due date', with: '15/12/2021'
    select "Low", :from => "task_priority"
    select "In-progress", :from => "task_status"
    select "Todo", :from => "task_phase_id"
    click_button('Submit')
    yield
  end
end

RSpec.feature "Tasks", type: :feature do
  describe "testing tasks page features" do
    it "shows 0 projects at first" do
      create_new_project_for_task_helper do
        expect(Task.all.size).to eq(0)
      end
    end

    it "gives option to create new task" do
      create_new_project_for_task_helper do
        expect(page).to have_content("Create new task")
      end
    end

    it "enables user to go back to projects" do 
      create_new_project_for_task_helper do
        click_link('Back to projects')
        expect(current_path).to eq('/projects')
        expect(page).to have_content("Projects")
      end
    end

    it "enables user to create new tasks" do
      create_new_project_for_task_helper do
        click_link('Create new task')
        expect(current_path).to eq('/projects/1/tasks/new')
        expect(page).to have_content("New Task")
      end
    end

    it "enables user to go back rather than fill form and create a new project" do 
      create_new_project_for_task_helper do
        click_link('Create new task')
        click_link('Back')
        expect(current_path).to eq('/projects/1/tasks')
      end
    end
  end

  describe "creating new tasks, editing and deleting" do
    before :each do
      Phase.create!(title: "Todo")
      Phase.create!(title: "In-progress")
      Phase.create!(title: "Completed")
    end


    it "enables user to fill form and create a new task" do 
      create_new_project_for_task_helper do
        click_link('Create new task')
        fill_in 'Title', with: 'Rails task 1'
        fill_in 'Description', with: 'Some description regarding rails task'
        fill_in 'Story point', with: '2'
        fill_in 'Due date', with: '15/12/2021'
        select "Low", :from => "task_priority"
        select "In-progress", :from => "task_status"
        select "Todo", :from => "task_phase_id"
        click_button('Submit')
        expect(current_path).to eq('/projects/1/tasks')
        expect(page).to have_content("Task was successfully created.")
        expect(Task.all.size).to eq(1)
      end
    end
    
    it "throws error when user doesn't fill mandatory form options while creating a new project" do 
      create_new_project_for_task_helper do
        click_link('Create new task')
        fill_in 'Description', with: 'Some description regarding rails task'
        fill_in 'Story point', with: '2'
        fill_in 'Due date', with: '15/12/2021'
        select "Low", :from => "task_priority"
        select "In-progress", :from => "task_status"
        select "Todo", :from => "task_phase_id"
        click_button('Submit')
        expect(page).to have_content("error prohibited this task from being saved")
      end
    end

    it "updates project when user edits it" do
      create_task_helper do
        click_link('Edit Task')
        fill_in 'Title', with: 'Agile task 1'
        click_button('Submit')
        expect(page).to have_content("Task was successfully updated.")
        expect(page).to have_content("Agile")
      end
    end

    it "gives user option to delete project" do 
      create_task_helper do
        click_link('Delete Task')
        expect(page).to have_content("Task was successfully destroyed.")
        expect(Task.all.size).to eq(0)
      end
    end
  end
end
