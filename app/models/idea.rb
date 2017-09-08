class Idea < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true

  belongs_to :category
  belongs_to :user

  has_many :idea_images
  has_many :images, through: :idea_images
end
