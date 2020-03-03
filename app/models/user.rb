# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :user_locations
  has_many :locations, through: :user_locations

  validates :user_name, :password, :name, :contact, :bio, presence: true
  validates :user_name, Uniqueness: true

end
