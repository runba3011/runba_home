class Group < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :group_user_relations
    validates :name , length: {maximum: 100}
  end

  has_many :group_user_relations
  has_many :users , through: :group_user_relations

end
