FactoryBot.define do
  factory :group_user_relation do
    association :user
    association :group
    authority_id {3}
  end
end
