class User < ApplicationRecord
  has_many :favorites
  validates :name, :email, :api_key, presence: true
  validates :email, uniqueness: true
  validates :api_key, uniqueness: true
end
