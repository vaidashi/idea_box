class Image < ApplicationRecord
  validates :name, presence: true
  validates :image_path, presence: true

  has_many :idea_images
  has_many :ideas, through: :idea_images
end
