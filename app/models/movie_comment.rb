class MovieComment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :text , length: {maximum: 1000}
    validates :user
    validates :movie
  end

  belongs_to :movie
  belongs_to :user
end
