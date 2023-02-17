FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    transient do
      person { Gimei.name }
    end
    family_name { person.last.kanji }
    given_name { person.first.kanji }
    phonetic_fn { person.last.katakana }
    phonetic_gn { person.first.katakana }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2020-01-01') }
  end
end