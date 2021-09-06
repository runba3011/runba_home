class MovieComment < ApplicationRecord
  extend ActiveHash::Association::ActiveRecordExtensions
  belongs_to :movie
  
  with_options presence: true do
    validates :text , length: {maximum: 1000}
    validates :user
    validates :movie
  end

end
