FactoryBot.define do
  factory :item do
    item_name                 { Faker::Lorem.word }
    description               { Faker::Lorem.sentence }
    category_id               { Faker::Number.between(from: 2, to: 11) }
    condition_id              { Faker::Number.between(from: 2, to: 7) }
    shipping_method_id        { Faker::Number.between(from: 2, to: 3) }
    ships_from_id             { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id          { Faker::Number.between(from: 2, to: 4) }
    price                     { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
