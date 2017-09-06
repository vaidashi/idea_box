require 'rails_helper'

describe "User can log in and out" do
  scenario "if account exists" do
    # user = create(:user) ##look to figure out problem
    user1 = User.create(username: "Dude", password: "123")
    visit '/'

    click_on("Login")

    expect(current_path).to eq(login_path)

    fill_in 'session[username]', with: user1.username
    fill_in 'session[password]', with: user1.password

    click_on "Login"
    expect(page).to have_content("Login Successful")
    expect(page).to have_content("Hi Dude")

    expect(page).to have_link("Logout")
    click_on "Logout"
    expect(current_path).to eq(root_path)
  end
end
