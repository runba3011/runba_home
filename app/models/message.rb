class Message < ApplicationRecord
  attr_accessor :time_type , :show_time #メッセージの時刻を表示する時、秒、分、時間、日、ヶ月、年を決めるためにあるもの
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
