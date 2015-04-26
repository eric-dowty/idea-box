require 'rails_helper'

RSpec.feature "login page" do

  before(:each) do
    User.create(name: "Tracy", username: "trace", password: "123", password_confirmation: "123", role: 1)
  end

  scenario "logs in an admin" do
    visit login_path

    fill_in "session[username]", with: "trace"
    fill_in "session[password]", with: "123"

    click_button "Login"
    expect(page).to have_content("Welcome Tracy")
    expect(page).to have_content("View Categories")
    expect(page).to have_content("View Users")
    expect(page).to have_content("Logout")
  end

  scenario "logs in an user" do
    visit login_path

    user = User.find_by(username: "trace")
    user.role = 0

    fill_in "session[username]", with: "trace"
    fill_in "session[password]", with: "123"

    click_button "Login"

    expect(page).to have_content("Welcome Tracy")
    expect(page).to have_content("Logout")
  end


  before(:each) do
    User.create(name: "Tracy", username: "trace", password: "123", password_confirmation: "123", role: 1)
  end

  scenario "does not log in without a name" do
    visit login_path

    fill_in "session[username]", with: nil
    fill_in "session[password]", with: "123"

    click_button "Login"

    expect(page).to have_content("Invalid login.")
  end

  scenario "does not log in without a password" do
    visit login_path

    fill_in "session[username]", with: "trace"
    fill_in "session[password]", with: nil

    click_button "Login"

    expect(page).to have_content("Invalid login.")
  end

  scenario "does not log in with a bad password" do
    visit login_path

    fill_in "session[username]", with: "trace"
    fill_in "session[password]", with: "wrong"

    click_button "Login"

    expect(page).to have_content("Invalid login.")
  end

end