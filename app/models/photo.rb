class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :location
  belongs_to :user

  validates :title, :image, presence: true
end
