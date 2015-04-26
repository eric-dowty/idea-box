require 'rails_helper'

RSpec.feature "user ideas view" do

  let!(:user) { User.create(
                  name: "Tracy", 
                  username: "trace", 
                  password: "123",
                  password_confirmation: "123", 
                  role: 0)
                }   

  let!(:category) { Category.create(name: "Stuff" )}

  scenario "after login a user can view individual ideas" do
    user = User.find_by(username: "trace")

    user.ideas.create(title: "New Idea", description: "lightbulb...", category_id: category.id )
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit user_path(user)

    click_link "New Idea"

    expect(page).to have_content("New Idea")
    expect(page).to have_content("lightbulb...")
    expect(page).to have_link("<< back to ideas")
  
    click_link "<< back to ideas"

    expect(page).to have_content("Welcome Tracy")
    expect(page).to have_content("New Idea")
  end

  scenario "after login lets a user create an idea" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit user_path(user)

    click_button "New Idea"
    fill_in "idea[title]", with: "Next Idea"
    fill_in "idea[description]", with: "blah blah"
    select "Stuff", from: "idea_category_id"

    click_button "Save Idea"    
    expect(page).to have_content("Next Idea")
    expect(page).to have_content("blah blah") 
    expect(page).to have_content("Stuff")  
  end

  scenario "after login lets a user edit an idea" do
    user.ideas.create(title: "New", description: "idea", category_id: category.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit user_path(user)

    click_link "edit"
    fill_in "idea[title]", with: "Next Idea"
    fill_in "idea[description]", with: "blah blah"
    select "Stuff", from: "idea_category_id"

    click_button "Save Idea"    
  end

end