require 'rails_helper'

RSpec.feature "logout" do 

  let!(:user1) { User.create(
                  name: "Tracy", 
                  username: "trace", 
                  password: "123",
                  password_confirmation: "123", 
                  role: 0)
                }   

  scenario "user logs in and then logs out" do
    visit login_path

    fill_in "session[username]", with: "trace"
    fill_in "session[password]", with: "123"
    click_button "Login"

    click_button "Logout"
    expect(page).to have_content("Logout successful")
  end
end