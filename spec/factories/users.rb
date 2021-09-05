FactoryBot.define do
  factory :user do
    nickname {Faker::Team.name}
    account_name{"user_name"}
    rank{1}
    point{0}
    image_name{Faker::Lorem.sentence}
    explain{Faker::Lorem.sentence}
    email {Faker::Internet.free_email}
    password {"password"}
    password_confirmation {"password"}
  end
end
