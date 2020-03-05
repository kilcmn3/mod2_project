# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :user_locations
  has_many :users, through: :user_locations
  has_many :posts
  has_many :photos

  validates :name, presence: true, uniqueness: true
  validates :latitude, :longitude, presence: true, uniqueness: true,  numericality: true

 
  def get_photos_and_posts
    (self.photos + self.posts ).sort_by(&:created_at)
  end 


end