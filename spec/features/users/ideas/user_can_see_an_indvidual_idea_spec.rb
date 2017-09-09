require 'rails_helper'

describe "User can see an individual idea" do
  scenario "on their idea show page" do
    user_1 = create(:user_with_ideas)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user_1)

    visit user_path(user_1)

    click_on "#{user_1.ideas[0].title}"

    expect(current_path).to eq(user_idea_path(user_1, user_1.ideas[0].id))
    expect(page).to have_content(user_1.ideas[0].description)
  end
end
