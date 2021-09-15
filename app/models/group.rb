class Group < ApplicationRecord

  with_options presence: true do
    validates :name , length: {maximum: 100}
  end

  has_many :group_user_relations , dependent: :destroy
  has_many :users , through: :group_user_relations
  has_many :messages
  has_one_attached :image
end
