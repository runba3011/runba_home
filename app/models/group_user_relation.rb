class GroupUserRelation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :user
    validates :group
    validates :authority_id  , numericality: {greater_than_or_equal_to: 1 , less_than_or_equal_to: 5}
  end
  belongs_to :user
  belongs_to :group
  belongs_to :authority
end
