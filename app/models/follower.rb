class Follower < ApplicationRecord
  with_options presence: true do
    validates :following
    validates :user
  end

  belongs_to :user
  belongs_to :following , class_name: "User"
end
