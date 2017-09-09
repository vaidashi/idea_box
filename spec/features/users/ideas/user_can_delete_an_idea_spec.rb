require 'rails_helper'

describe "User can delete their idea" do
  scenario "from their idea show page" do
    user_1 = create(:user_with_ideas)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user_1)

    visit user_path(user_1)

    expect(Idea.count).to eq(2)

    click_on "#{user_1.ideas[0].title}"

    click_on "Delete"

    expect(current_path).to eq(user_path(user_1))
    expect(Idea.count).to eq(1)
  end
end
