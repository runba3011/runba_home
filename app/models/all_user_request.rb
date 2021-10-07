class AllUserRequest < ApplicationRecord
  with_options presence: true do 
    validates :text
    validates :is_open_name
    validates :user
  end

  belongs_to :user
end
