require 'rails_helper'

RSpec.feature "Auth", type: :feature do
  before :each do
    user = User.create!(username: "endy", email: "endy@wearesnook.com", password: "password")
  end

  scenario "signing in with an email and password" do
    visit new_user_session_path
    fill_in "user_email", with: "endy@wearesnook.com"
    fill_in "user_password", with: "password"
    click_button "Log in"
    expect(page).to have_content "TDD-Blog"
  end

  scenario "signing in with wrong email and/or password" do
    visit new_user_session_path
    fill_in "user_email", with: "wrong-endy@wearesnook.com"
    fill_in "user_password", with: "password"
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password"
  end
end
