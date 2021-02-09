class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :text, :image,presence: true 
  validates :price, numericality: { greater_than: 300, less_than: 9999999}
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'Half-width number' } do
    validates :price
  end

  validates :category_id, :state_id, :shipping_charge_id, :prefecture_id, :date_shipment_id, numericality: { other_than: 1, message: "Select"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :date_shipment

end
