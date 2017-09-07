require 'rails_helper'

RSpec.describe Idea, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:category_id) }
  end

  context "assocations" do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end
end
