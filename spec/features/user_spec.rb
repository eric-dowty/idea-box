require 'rails_helper'

RSpec.describe "user page" do

  before(:each) do
    category = Category.create(name: "Greatness")
    new_user = User.create(name: "Tracy", username: "trace", password: "123", password_confirmation: "123", role: 1)
    new_user.ideas.create(title: "Great idea", description: "the greatest idea", category_id: category.id)
  end

  context "following login" do

    it "shows all ideas" do
      user = User.find_by(username: "trace")
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
      visit user_path(user)
      
      expect(page).to have_content("Great idea")
    end

    it "shows all categories" do
    end

  end

end