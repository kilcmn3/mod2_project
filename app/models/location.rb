# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :user_locations
  has_many :users, through: :user_locations
  has_many :posts
  has_many :photos

  validates :name, presence: true, uniqueness: true
  validates :latitude, :longtitude, presence: true, uniqueness: true,  numericality: true

end