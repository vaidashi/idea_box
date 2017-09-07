class Idea < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true 
  belongs_to :category
  belongs_to :user
end
