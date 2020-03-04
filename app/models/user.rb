# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  
  has_many :photos , dependent: :destroy
  has_many :posts , dependent: :destroy
  has_many :user_locations , dependent: :destroy
  has_many :locations, through: :user_locations , dependent: :destroy

  validates :user_name, :password, :name, :contact, :bio, presence: true
  validates :user_name, Uniqueness: true

end
