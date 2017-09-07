require 'rails_helper'

describe "User can create a new idea" do
  scenario "once they log in" do
    user = create(:user)
    category1 = Category.create(name: "Software Development")
    category2 = create(:category)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user)

    visit user_path(user)
    click_on("Add a New Idea")

    expect(page).to have_content("Create a new idea")
    fill_in "idea[title]", with: "Make the next best thing"
    fill_in "idea[description]", with: "It's a secret"
    select "Software Development", from: "idea[category_id]"

    click_button "Create"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Make the next best thing")
    expect(user.ideas.count).to eq(1)
  end
end
