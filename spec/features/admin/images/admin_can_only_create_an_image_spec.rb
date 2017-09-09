require 'rails_helper'

feature "When a user visits the images page" do
  context "as an admin" do

    scenario "they can see a list of all images" do
      admin = User.create(username: "admin", password: "boom", role: "admin")
      image1 = create(:image)
      image2 = create(:image)

      allow_any_instance_of(ApplicationController).to receive(
      :current_user).and_return(admin)

      visit admin_images_path

      expect(page).to have_content('Image Listing for Idea Box')
      expect(page).to have_css("img")
      expect(page).to have_content(image1.name)
      expect(page).to have_content(image2.name)
    end


  end
end
