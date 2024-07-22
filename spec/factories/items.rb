FactoryBot.define do
  factory :item do
    item_name        { Faker::Lorem.word }
    item_info        { Faker::Lorem.sentence }
    category_id      { rand(2..11) }
    item_status_id   { rand(2..7) }
    shipping_cost_id { rand(2..4) }
    prefecture_id    { rand(2..48) }
    shipping_day_id  { rand(2..4) }
    price            { rand(300..9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public/images/test_image.png')), filename: 'test_image.png')
    end
  end
end
