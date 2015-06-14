require 'rails_helper'

RSpec.describe User, type: :feature do
  scenario 'logged in admin sees categories index' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    expect(page).to have_content("All Categories")
  end

  xscenario "default user sees 404 error in admin area" do
    user = User.create(username: "joerugular", 
                       password: "password", 
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit admin_categories_path
    expect(page).to_not have_content("All Categories")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end