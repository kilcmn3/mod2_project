# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :user_locations
  has_many :users, through: :user_locations
  has_many :posts
  has_many :photos
end
