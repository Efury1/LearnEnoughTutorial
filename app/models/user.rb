class User < ApplicationRecord
  has_many :microposts
  validates FILL_IN, presence: true #replace fill with correct placeholder
  validates FILL_IN, presence: true #replace fill_in with the correct code
end
