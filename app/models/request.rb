class Request < ApplicationRecord
  with_options presence: true do
    validates :text
    validates :user
  end

  belongs_to :user
end
