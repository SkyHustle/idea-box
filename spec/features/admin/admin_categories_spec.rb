require 'rails_helper'

RSpec.describe User, type: :feature do
  scenario "logged in admin sees categories" do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    assert page.has_content?("All Categories")
  end
end