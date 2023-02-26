FactoryBot.define do
  factory :item do
    name {Faker::Commerce.product_name}
    price {Faker::Number.between(from: 300, to: 9999999)}
    description {Faker::Lorem.paragraph_by_chars(number: 10)}
    category_id {Faker::Number.between(from: 2, to: 11)}
    condition_id {Faker::Number.between(from: 2, to: 7)}
    shipping_cost_on_id{Faker::Number.between(from: 2, to: 3)}
    origin_id{Faker::Number.between(from: 2,to: 48)}
    lead_time_id{Faker::Number.between(from: 2, to: 4)}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
