class Micropost < ApplicationRecord
  belongs_to :users
  validates :content, length: { maximum: 140 }, presence: true
end
