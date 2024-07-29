FactoryBot.define do
  factory :purchase_address do
    postal_code { Faker::Base.numerify('###-####') }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    house_name { Faker::Address.secondary_address }
    phone_number { Faker::Base.numerify('090########') }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
