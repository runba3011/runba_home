class Authority < ActiveHash::Base
  self.data = [
    {id: 1 , name: "レベル１"},
    {id: 2 , name: "レベル２"},
    {id: 3 , name: "レベル３"},
    {id: 4 , name: "レベル４"},
    {id: 5 , name: "レベル５"}
  ]

  include ActiveHash::Associations
  has_many :group_user_relations

end