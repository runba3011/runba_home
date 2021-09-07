FactoryBot.define do
  factory :group_user_relation do
    association :user
    association :group
    authority_id {Faker::Number.between(from: 1 , to:5)}
  end
end
