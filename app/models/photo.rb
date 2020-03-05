class Photo < ApplicationRecord
  
  has_one_attached :image, dependent: :purge_now
  belongs_to :user
  belongs_to :location
  belongs_to :user

  validates :title, presence: true
end
