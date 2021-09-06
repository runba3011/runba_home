class Message < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :room
    validates :text , length: {maximum: 1000}
  end
  belongs_to :user
  belongs_to :room
end
