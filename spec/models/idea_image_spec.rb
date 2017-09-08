require 'rails_helper'

RSpec.describe IdeaImage, type: :model do
  context "assocations" do
    it { should belong_to(:idea) }
    it { should belong_to(:image) }
  end
end
