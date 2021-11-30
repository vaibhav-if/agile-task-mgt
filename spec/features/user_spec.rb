require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before(:each) do 
    visit("/users/sign_in")
  end

  it "gives option to sign-up" do
    expect(page).to have_content("New user?")
  end

  it "gives option to reset password" do
    expect(page).to have_content("Forgot your password?")
  end

  it 'new user can sign-up' do 
    click_link('Sign up instead')
    expect(current_path).to eq('/users/sign_up')
    expect(page).to have_content('Sign up')
  end

  it 'user can reset password' do 
    click_link('Click here')
    expect(current_path).to eq('/users/password/new')
    expect(page).to have_content('Forgot your password?')
  end
end
