Faker::Config.locale = :ja
FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    first_name_kana { Array.new(3) { rand(0x30A1..0x30F6).chr('UTF-8') }.join }
    last_name_kana { Array.new(3) { rand(0x30A1..0x30F6).chr('UTF-8') }.join }
    birthday { Faker::Date.birthday }
  end
end
