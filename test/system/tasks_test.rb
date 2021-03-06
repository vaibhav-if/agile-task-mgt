require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Decription", with: @task.decription
    fill_in "Due date", with: @task.due_date
    fill_in "End date", with: @task.end_date
    fill_in "Priority", with: @task.priority
    fill_in "Start date", with: @task.start_date
    fill_in "Status", with: @task.status
    fill_in "Story point", with: @task.story_point
    fill_in "Task type", with: @task.task_type
    fill_in "Title", with: @task.title
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "Edit", match: :first

    fill_in "Decription", with: @task.decription
    fill_in "Due date", with: @task.due_date
    fill_in "End date", with: @task.end_date
    fill_in "Priority", with: @task.priority
    fill_in "Start date", with: @task.start_date
    fill_in "Status", with: @task.status
    fill_in "Story point", with: @task.story_point
    fill_in "Task type", with: @task.task_type
    fill_in "Title", with: @task.title
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "destroying a Task" do
    visit tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task was successfully destroyed"
  end
end
