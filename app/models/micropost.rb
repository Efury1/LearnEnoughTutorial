class Micropost < ApplicationRecord
  belong_to :users
  validates :content, length: { maximum: 140 }, presence: true
end
