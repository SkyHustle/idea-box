require 'rails_helper'

RSpec.describe User, type: :feature do
  scenario "logged in admin sees categories" do
    admin = User.create(username: "joerugular", 
                       password: "password", 
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    expect(page).to_not have_content("All Categories")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end