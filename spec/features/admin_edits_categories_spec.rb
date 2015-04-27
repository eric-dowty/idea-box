require 'rails_helper'

RSpec.feature "admin edits categories" do

  before(:each) do
    Category.create(name: "things")
    new_user = User.create(name: "Tracy", username: "trace", password: "123", password_confirmation: "123", role: 1)
  end

  scenario "after login admin views categories" do
    admin = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit user_path(admin)

    click_link("View Categories")

    expect(page).to have_content("things")
  end

  scenario "admin edits a category" do
    admin = User.first
    category = Category.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    click_link("edit")

    fill_in "categories[name]", with: "stuff"
    click_button "Save Categories"

  end


end