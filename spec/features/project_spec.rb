require 'rails_helper'

RSpec.feature "Projects", type: :feature do

  # before(:each) do 
  #   login_and_logout_with_warden do
  #     visit("/projects")
  #   end
  # end


  describe "dashboard features" do
    it "shows 0 projects upon first sign in" do
      login_and_logout_with_warden do
        visit("/projects")
      expect(Project.all.size).to eq(0)
      end
    end
  
    it "gives option to create new project" do
      login_and_logout_with_warden do
        visit("/projects")
        expect(page).to have_content("Create new project")
      end
    end
  
    it "gives user option to view profile" do
      login_and_logout_with_warden do
        visit("/projects")
        click_link('Welcome')
        expect(page).to have_content("Edit profile")
      end
    end
  
    it "enables user to log out" do
      login_and_logout_with_warden do
        visit("/projects")
        click_link('Welcome')
        click_link('Logout')
        expect(current_path).to eq('/users/sign_in')
        expect(page).to have_content("Log in")
      end
    end
  
    it "gives user option to create new projects" do
      login_and_logout_with_warden do
        visit("/projects")
        click_link('Create new project')
        expect(current_path).to eq('/projects/new')
        expect(page).to have_content("New Project")
      end
    end

    it "enables user to go back rather than fill form and create a new project" do 
      login_and_logout_with_warden do
        visit("/projects")
        click_link('Create new project')
        click_link('Back')
        expect(current_path).to eq('/projects')
      end
    end
  end

  describe "creating new project, editing and deleting" do
    it "enables user to fill form and create a new project" do 
      login_and_logout_with_warden do
        visit("/projects")
        click_link('Create new project')
        fill_in 'Title', with: 'Rails'
        fill_in 'Description', with: 'Some description regarding rails'
        fill_in 'Due date', with: '15/12/2021'
        fill_in 'project_all_phases', with: 'ToDo, In-progress, Completed'
        click_button('Submit')
        expect(current_path).to eq('/projects')
        expect(page).to have_content("Project was successfully created.")
        expect(Project.all.size).to eq(1)
      end
    end  
  
    it "throws error when user doesn't fill mandatory form options while creating a new project" do 
      login_and_logout_with_warden do
        visit("/projects")
        click_link('Create new project')
        fill_in 'Description', with: 'Some description regarding rails'
        fill_in 'Due date', with: '15/12/2021'
        fill_in 'project_all_phases', with: 'ToDo, In-progress, Completed'
        click_button('Submit')
        expect(page).to have_content("error prohibited this project from being saved")
      end
    end
  
    it "enables user option to view tasks for a created project" do 
      login_and_logout_with_warden do
        visit("/projects")
        click_link('Create new project')
        fill_in 'Title', with: 'Rails'
        fill_in 'Description', with: 'Some description regarding rails'
        fill_in 'Due date', with: '15/12/2021'
        fill_in 'project_all_phases', with: 'ToDo, In-progress, Completed'
        click_button('Submit')
        click_link('Show Tasks')
        expect(current_path).to eq('/projects/1/tasks')
        expect(page).to have_content("Tasks")
      end
    end
  
    it "gives user option to edit project" do 
      login_and_logout_with_warden do
        visit("/projects")
        click_link('Create new project')
        fill_in 'Title', with: 'Rails'
        fill_in 'Description', with: 'Some description regarding rails'
        fill_in 'Due date', with: '15/12/2021'
        fill_in 'project_all_phases', with: 'ToDo, In-progress, Completed'
        click_button('Submit')
        click_link('Edit Project')
        expect(current_path).to eq('/projects/1/edit')
        expect(page).to have_content("Editing Project")
      end
    end
  
    it "updates project when user edits it" do
      login_and_logout_with_warden do
        visit("/projects")
        click_link('Create new project')
        fill_in 'Title', with: 'Rails'
        fill_in 'Description', with: 'Some description regarding rails'
        fill_in 'Due date', with: '15/12/2021'
        fill_in 'project_all_phases', with: 'ToDo, In-progress, Completed'
        click_button('Submit')
        click_link('Edit Project')
        fill_in 'Title', with: 'Agile'
        click_button('Submit')
        expect(page).to have_content("Project was successfully updated.")
        expect(page).to have_content("Agile")
      end
    end
  
    it "gives user option to delete project" do 
      login_and_logout_with_warden do
        visit("/projects")
        click_link('Create new project')
        fill_in 'Title', with: 'Rails'
        fill_in 'Description', with: 'Some description regarding rails'
        fill_in 'Due date', with: '15/12/2021'
        fill_in 'project_all_phases', with: 'ToDo, In-progress, Completed'
        click_button('Submit')
        click_link('Delete Project')
        expect(page).to have_content("Project was successfully destroyed.")
        expect(Project.all.size).to eq(0)
      end
    end
  end

end
