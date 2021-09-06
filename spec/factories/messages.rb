FactoryBot.define do
  factory :message do
    text {Faker::Rorem.sentence}
    association :user
    association :group
  end
end
