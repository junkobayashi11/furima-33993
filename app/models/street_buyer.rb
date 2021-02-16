class StreetBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :municipality, :address, :building_name, :phone_number, :prefecture_id, :user_id, :item_id, :token

  validates :municipality, :address, :user_id, :item_id, :token, presence: true
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(post_code: post_code, municipality: municipality, prefecture_id: prefecture_id, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id )
  end
end