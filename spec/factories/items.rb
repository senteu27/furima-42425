FactoryBot.define do
  factory :item do
    name {Faker::Commerce.product_name}
    description {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)}
    condition_description_id {rand(2..7)}
    category_id {rand(2..11)}
    shipping_day_id {rand(2..4)}
    prefecture_id {rand(2..48)}
    shipping_prise_id {rand(2..4)}
    association :user

    after (:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
