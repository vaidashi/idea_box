require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  context "assocations" do
    it { should have_many(:ideas) }
  end
end
