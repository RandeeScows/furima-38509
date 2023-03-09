FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    township { 'Hoge市' }
    block {'Fuga町1-1'}
    building {'Piyoビル'}
    tel { Faker::Number.between(from: 1234567890, to: 12345678901) } 
    token {"tok_abc000"}
  end
end
