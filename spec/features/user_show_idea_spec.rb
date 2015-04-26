require 'rails_helper'

RSpec.feature "show user idea" do

  let!(:user) { User.create(
                name: "Tracy", 
                username: "trace", 
                password: "123",
                password_confirmation: "123", 
                role: 0)
              }   

  let!(:category) { Category.create(name: "Sports")}

  # scenario "user creates an idea" do
  #   user.ideas.create(title: "Next Big Thing", description: "watermellon pizza")

  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #   # save_and_open_page
  #   visit user_path(user)
  #   save_and_open_page
  #   click_button "Add Idea"

  #   expect(page).to have_content("Next Big Thing")
  #   expect(page).to have_content("watermellon pizza")
  #   expect(page).to have_link("<< back to ideas")

  # end

end

