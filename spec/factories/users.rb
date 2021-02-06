FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    frigana_first_name    { Gimei.first.katakana }
    frigana_last_name     { Gimei.last.katakana }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { 'password' }
    birth_date            { Faker::Date.birthday }
  end
end
