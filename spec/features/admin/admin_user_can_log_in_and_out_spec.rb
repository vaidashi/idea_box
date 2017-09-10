require 'rails_helper'

describe "Admin user can log in and out" do
  scenario "if account exists" do
    admin = User.create(username: "AdminDude", password: "abc", role: "admin")

    visit '/'
    click_on("Login")

    expect(current_path).to eq(login_path)

    fill_in 'session[username]', with: admin.username
    fill_in 'session[password]', with: admin.password

    click_on("Login")

    expect(page).to have_content("Login Successful")
    expect(page).to have_content("Welcome, #{admin.username}")

    expect(page).to have_link("Logout")
    click_on "Logout"
    expect(current_path).to eq(root_path)
  end
end
