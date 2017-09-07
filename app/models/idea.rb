class Idea < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true

  belongs_to :category
  belongs_to :user
end
