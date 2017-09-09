require 'rails_helper'

RSpec.describe Image, type: :model do

  context "validations" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:image_path) }
    end

    context "assocations" do
      it { should have_many(:idea_images) }
      it {should have_many(:ideas).through(:idea_images)}
    end
end
