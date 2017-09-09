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

    scenario "they can create an image" do
      admin = User.create(username: "admin", password: "boom", role: "admin")
      image1 = create(:image)

      allow_any_instance_of(ApplicationController).to receive(
      :current_user).and_return(admin)

      visit admin_images_path
      click_on "Add a new image for Idea Box"
      expect(current_path).to eq(new_admin_image_path)

      fill_in 'image[name]', with: "BullDog Surfing"
      fill_in 'image[image_path]', with: "https://theocbarkyard.files.wordpress.com/2015/09/surf.jpg"
      click_on("Create Image")

      expect(current_path).to eq(admin_images_path)
      expect(Image.count).to eq(2)
      expect(page).to have_content(Image.last.name)
    end

    scenario "they can delete an image" do
      admin  = User.create(username: "admin", password: "boom", role: "admin")
      image1 = create(:image)
      image2 = create(:image)

      allow_any_instance_of(ApplicationController).to receive(
      :current_user).and_return(admin)

      visit admin_images_path
      expect(Image.count).to eq(2)
      expect(page).to have_content(image1.name)
      expect(page).to have_content(image2.name)

      click_on("Delete", :match => :first)

      expect(current_path).to eq(admin_images_path)
      expect(Image.count).to eq(1)
      expect(page).to have_content(image2.name)
    end

  end
end
