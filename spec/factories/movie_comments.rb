FactoryBot.define do
  factory :movie_comment do
    text {"こめんと"}

    association :movie
    association :user
  end
end
