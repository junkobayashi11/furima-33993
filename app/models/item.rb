class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :text, :price, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }

  validates :category_id, :state_id, :shipping_charge_id, :prefecture_id, :date_shipment_id,
            numericality: { other_than: 1, message: 'Select' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :date_shipment
end
