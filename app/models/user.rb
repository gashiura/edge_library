class User < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password

  has_many :reviews
  has_many :rentals
  has_many :favorites
end
