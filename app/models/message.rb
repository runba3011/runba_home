class Message < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :group
  end
  validates :text , length: {maximum: 1000}
  validates :text , presence: true , on: :create

  has_many_attached :images
  belongs_to :user
  belongs_to :group
end
