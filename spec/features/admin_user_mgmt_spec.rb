require 'rails_helper'

RSpec.feature "admin manages users" do

  # let!(:user) { User.create(name: "Tracy", username: "trace", password: "123", password_confirmation: "123", role: 1) }

    let!(:user1) { User.create(
                  name: "Tracy", 
                  username: "trace", 
                  password: "123",
                  password_confirmation: "123", 
                  role: 0)
                }   


    let!(:user2) { User.create(
                  name: "Tracy", 
                  username: "trey", 
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

  scenario "admin can change user roles" do
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    expect(page).to have_content("trace")
    expect(page).to have_link("Show")
    expect(page).to have_link("Edit")
    expect(page).to have_button("Delete")

    within("#user_#{user1.id}") do
      click_link('Edit')
    end
    
    expect(page).to have_content(user1.username)
    choose("user_role_admin")
    click_button "Update"
    expect(page).to have_content(user1.username)
    expect(page).to have_content("trace is now a admin user")
    user1.reload
    expect(user1.role).to eq("admin")

  end

  scenario "admin cannot change user name" do
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    expect(page).to have_content("trace")
    expect(page).to have_link("Show")
    expect(page).to have_link("Edit")
    expect(page).to have_button("Delete")

    within("#user_#{user1.id}") do
      click_link('Edit')
    end
    
    expect(page).to have_content(user1.username)
    fill_in "user[username]", with: "eric"
    click_button "Update"
    expect(page).to have_content("trace")
  end


  scenario "admin can delete user" do
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    expect(page).to have_content("trace")
    expect(page).to have_link("Show")
    expect(page).to have_link("Edit")
    expect(page).to have_button("Delete")

    first('input[type="submit"]').click 
    
    expect(page).to_not have_content("trace")
  end


end