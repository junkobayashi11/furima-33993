FactoryBot.define do
  factory :item do
    name            { 'サンプル商品' }
    text            { 'サンプル商品の説明' }
    price           { 1000 }
    category_id        { 2 }
    state_id           { 2 }
    shipping_charge_id { 2 }
    date_shipment_id   { 2 }
    prefecture_id      { 2 }
    association :user
  end
end
