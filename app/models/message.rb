class Message < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :group
  end
  validates :text , presence: true , on: :create , unless: :is_attached?

  has_one_attached :image
  belongs_to :user
  belongs_to :group

  def is_attached?
    self.image.attached?
  end
end
