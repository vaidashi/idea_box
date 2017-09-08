require 'rails_helper'

describe "User can add image" do
  scenario "for an idea of theirs" do
    user_1 = create(:user_with_ideas)
    image  = create(:image)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user_1)

    visit user_path(user_1)

    click_on "#{user_1.ideas[0].title}"

    click_on "Edit"

    check "#{image.name}"

    click_on "Update Idea"

    expect(current_path).to eq(user_idea_path(user_1, user_1.ideas[0].id))
    expect(page).to have_css("img")
  end
end
