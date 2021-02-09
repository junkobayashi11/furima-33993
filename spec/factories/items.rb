FactoryBot.define do
  factory :item do
    name            { Faker::Lorem.word }
    text            { Faker::Lorem.sentence }
    price           { Faker::Number.number(digits: 5)}
    category        { Category.find(2) }
    state           { State.find(2) }
    shipping_charge { ShippingCharge.find(2) }
    date_shipment   { DateShipment.find(2) }
    prefecture      { Prefecture.find(2) }
    association :user
  end
end