require 'rails_helper'

RSpec.describe User, type: :feature do
  scenario "user is able to create account" do
    visit new_user_path

    fill_in "Username", with: "BamBam"
    fill_in "Password", with: "Bams"
    click_button "Register"

    expect(page).to have_content("BamBam")
  end
end