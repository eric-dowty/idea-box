require 'rails_helper'

RSpec.feature "user delete idea" do

  before(:each) do
    category = Category.create(name: "Greatness")
    new_user = User.create(name: "Tracy", username: "trace", password: "123", password_confirmation: "123", role: 1)
    new_user.ideas.create(title: "Great idea", description: "the greatest idea", category_id: category.id)
  end

  scenario "user deletes an idea" do
    user = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("Great idea")

    click_button "delete"

    expect(Idea.all).to eq([])
  end
end