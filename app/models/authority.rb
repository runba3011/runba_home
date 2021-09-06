class Authority < ActiveHash::Base
  

  include ActiveRecord::Associations
  has_many :group_user_relations

end