class Message < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :group
  end
  validates :text , presence: true , on: :create , unless: :is_attached?

  has_many_attached :images
  belongs_to :user
  belongs_to :group

  def is_attached?
    self.images.attached?
  end
end
