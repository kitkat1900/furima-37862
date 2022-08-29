FactoryBot.define do
  factory :order_shipping_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code    {'123-4567'}
    prefecture_id  {3}
    city      {'横浜市'}
    address     {'1-1-1'}
    building  {'建物ビル'}
    phone_number   {'09022223333'} 
  end
end
