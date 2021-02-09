FactoryBot.define do
  factory :item do
    name            { "サンプル商品" }
    text            { "サンプル商品の説明" }
    price           { 1000 }
    category        { 2 }
    state           { 2 }
    shipping_charge { 2 }
    date_shipment   { 2 }
    prefecture      { 2 }
    association :user
  end
end