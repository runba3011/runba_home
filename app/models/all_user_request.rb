class AllUserRequest < ApplicationRecord
  with_options presence: true do 
    validates :text
    validates :is_open_name
    validates :user
    validates :request_creater_id
  end

  belongs_to :user
end
