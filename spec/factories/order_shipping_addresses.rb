FactoryBot.define do
  factory :order_shipping_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { 3 }
    city          { '横浜市緑区' }
    address       { '青山1-1-1' }
    building      { '柳ビル' }
    phone_number  { '09012345678' }
  end
end
