require 'rails_helper'


describe "User can view list of categories" do
  scenario "from categories index page" do
    user = create(:user)

    category1 = create(:category)
    category2 = create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/categories'

    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)
    expect(page).to_not have_link "Edit"
    expect(page).to_not have_link "Delete"
  end

  scenario "but can't create nor destroy a category" do
    user = create(:user)
    category1 = create(:category)
    category2 = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_category_path

    expect(page).to have_content("The page you were looking for doesn't exist.")

    visit '/categories'

    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)
    expect(page).to_not have_link("Delete")
  end
end
