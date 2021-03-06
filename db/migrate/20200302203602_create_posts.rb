# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :rating
      t.integer :user_id
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
