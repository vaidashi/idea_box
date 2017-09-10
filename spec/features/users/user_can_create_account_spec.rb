require 'rails_helper'

describe "User can create an account" do
  scenario "if not already in database" do

    visit '/'

    click_on("Create New Account")

    expect(current_path).to eq(new_user_path)

    fill_in 'user[username]', with: 'Dude'
    fill_in 'user[password]', with: 'password'

    click_on("Create Account")

    expect(current_path).to eq user_path(User.last)
    expect(page).to have_content("Welcome, Dude")
    expect(page).to have_content("Successful signup")
  end
end
