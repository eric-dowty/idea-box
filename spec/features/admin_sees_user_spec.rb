require 'rails_helper'


RSpec.feature "admin sees user" do

   let!(:user) { User.create(
                  name: "Tracy", 
                  username: "trace", 
                  password: "123",
                  password_confirmation: "123", 
                  role: 0)
                }   
    
    let!(:admin) { User.create(
                  name: "Eric", 
                  username: "edowty", 
                  password: "123", 
                  password_confirmation: "123", 
                  role: 1)
                }

  scenario "clicking show button for user" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    within("#user_#{user.id}") do
      click_link('Show')
    end

    expect(page).to have_content("User: trace")
    expect(page).to have_content("Name: Tracy")
    expect(page).to have_content("Role: default")
    expect(page).to have_link("<< back to users")
  end

end