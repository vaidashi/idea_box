require 'rails_helper'

describe "User can't visit another user's page" do
  scenario "and see their ideas" do
    user_1 = create(:user)
    user_2 = create(:user_with_ideas)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user_1)

    visit user_path(user_2)

    expect(page).to have_content("Welcome, #{user_1.username}")
    expect(page).to_not have_content("Welcome, #{user_2.username}")
    expect(page).to_not have_content(user_2.ideas[0].description)
    expect(page).to_not have_content(user_2.ideas[1].description)
  end
end
