FactoryBot.define do
  factory :sns_credential do
    provider {"google_oauth2"}
    uid {"111897667758725382082"}
    association :user
  end
end
