class Buyer < ApplicationRecord
  belongs_to :item
  has_one :street_address
  belongs_to :user
end
