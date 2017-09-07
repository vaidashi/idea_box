require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
  end

  it "can be created as an admin" do
    user = User.create(username: "Penolope", password: "boom", role: "admin")

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "can be created as default users" do
    user = User.create(username: "Pepe", password: "wayo")

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end

  context "assocations" do
    it { should have_many(:ideas) }
  end
end
