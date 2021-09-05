class StickmanWarComment < ApplicationRecord
  with_options presence: true do
    validates :stage_id
    validates :text
    validates :user
    validates :stage_type
  end

  belongs_to :user
end
