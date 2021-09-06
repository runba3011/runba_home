FactoryBot.define do
  factory :group do
    icon_image_name {"画像の名前.png"}
    explain {Faker::Lorem.sentence}
    name {Faker::Lorem.sentence}
    
  end
end
