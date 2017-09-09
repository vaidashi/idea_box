require 'rails_helper'

describe "User can view list of all images" do
  scenario "from image index page" do
    user = create(:user)
    image1 = create(:image)
    image2 = create(:image)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user)

    visit user_path(user)

    click_on("See Image Listing")

    expect(current_path).to eq(images_path)
    expect(page).to have_content(image1.name)
    expect(page).to have_content(image2.name)
    expect(page).to_not have_link("Delete")
    expect(page).to_not have_link("Add a new image for Idea Box")
  end

  scenario "but can't create or delete an image" do
    user = create(:user)
    image1 = create(:image)
    image2 = create(:image)

    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user)

    visit new_admin_image_path

    expect(page).to have_content("The page you were looking for doesn't exist.")

    visit '/images'

    expect(current_path).to eq(images_path)
    expect(page).to have_content(image1.name)
    expect(page).to have_content(image2.name)
    expect(page).to_not have_link("Delete")
    expect(page).to_not have_link("Add a new image for Idea Box")
  end
end
