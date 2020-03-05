class Photo < ApplicationRecord
  
  has_one_attached :image, dependent: :purge_now
  belongs_to :user
  belongs_to :location
  belongs_to :user

  validates :title, presence: true

  def find_location
    Location.find(self.location_id)
  end

  def find_post
    Post.find_by(location_id: self.location_id)
  end
  
end
