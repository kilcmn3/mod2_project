# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :location
  belongs_to :user
end
