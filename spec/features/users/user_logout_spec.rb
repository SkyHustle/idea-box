require 'rails_helper'

RSpec.describe User, type: :feature do
  scenario "logged in user successfully logs out" do
    user = User.create(username: "taz", password: "mania")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "mania"
    click_button "Login"

    expect(page).to have_content(user.username)

    click_link "Logout"

    expect(page).to_not have_content(user.username)
  end
end