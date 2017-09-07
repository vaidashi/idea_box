require 'rails_helper'

feature "When a user visits the categories page" do

  context "as an admin" do
    scenario "they can see list of all categories" do
      admin = User.create(username: "admin", password: "boom", role: "admin")
      category1 = create(:category)
      category2 = create(:category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content('Category Listing for Idea Box')
      expect(page).to have_content(category1.name)
      expect(page).to have_content(category2.name)
    end

    scenario "they can create a category" do
      xitadmin = User.create(username: "admin", password: "boom", role: "admin")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content('Admin Categories')
    end
  end

end
