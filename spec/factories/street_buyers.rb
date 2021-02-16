FactoryBot.define do
  factory :street_buyer do
    post_code      { '123-4567' }
    prefecture_id  { 2 }
    municipality   { '横浜市' }
    building_name  { "" }
    address        { '青山 1-1-1' }
    phone_number   { '07011111111' }
    token          { 'sk_test_dfd00b000f0bd00cea0c00e0' }
  end
end
