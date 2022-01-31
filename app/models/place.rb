class Place < ApplicationRecord
  # geocoded_by :address
  # geocoded_by :full_address
  after_validation :geocode
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
