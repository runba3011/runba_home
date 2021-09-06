class GroupUserRelation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensitons
  with_options presence: true do
    validates :user
    validates :room
    validates :authority_id  , numericality: {greater_than_or_equal_to: 1 , less_than_or_equal_to: 5}
  end
  belongs_to :user
  belongs_to :room
  belongs_to :authority
end
