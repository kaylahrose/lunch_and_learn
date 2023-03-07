class User < ApplicationRecord
  validates :name, :email, :api_key, presence: true
  validates :email, uniqueness: true
end
