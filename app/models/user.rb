class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true , uniqueness: true
  enum role: ["default", "admin"]
  has_many :ideas
end
