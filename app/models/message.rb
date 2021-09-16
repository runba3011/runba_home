class Message < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :group
  end
  validates :text , presence: true , on: :create

  has_many_attached :images
  belongs_to :user
  belongs_to :group
end
