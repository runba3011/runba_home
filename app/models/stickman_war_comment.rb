class StickmanWarComment < ApplicationRecord
  with_options presence: true do
    validates :stage_id
    validates :text , length:{maximum: 500}
    validates :user
    validates :stage_type
  end

  belongs_to :user
end
