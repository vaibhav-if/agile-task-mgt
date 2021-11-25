require "application_system_test_case"

class SubTasksTest < ApplicationSystemTestCase
  setup do
    @sub_task = sub_tasks(:one)
  end

  test "visiting the index" do
    visit sub_tasks_url
    assert_selector "h1", text: "Sub Tasks"
  end

  test "creating a Sub task" do
    visit sub_tasks_url
    click_on "New Sub Task"

    fill_in "Status", with: @sub_task.status
    fill_in "Title", with: @sub_task.title
    click_on "Create Sub task"

    assert_text "Sub task was successfully created"
    click_on "Back"
  end

  test "updating a Sub task" do
    visit sub_tasks_url
    click_on "Edit", match: :first

    fill_in "Status", with: @sub_task.status
    fill_in "Title", with: @sub_task.title
    click_on "Update Sub task"

    assert_text "Sub task was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub task" do
    visit sub_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub task was successfully destroyed"
  end
end
