FactoryBot.define do
  factory :stickman_war_comment do
    stage_type {"basic"}
    stage_id {Faker::IDNumber.valid}
    text {Faker::Lorem.sentence}
    association :user
  end
end
