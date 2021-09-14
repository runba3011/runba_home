class GroupGroupUserRelation 
  include ActiveModel::Model
  attr_accessor :explain , :name , :icon_image_name , :user_ids , :authority_ids

  with_options presence: true do
    validates :name , length: {maximum: 100}
    validates :user_ids
    validates :authority_ids
  end

  def save
    
    authority_ids.each do |authority_id|
      authority_id = authority_id.to_i
      unless 1<= authority_id && authority_id <= 5
        return
      end
    end

    group = Group.new(name: name , explain: explain)
    group = Group.create(name: name , explain: explain)
    roop_time = 0
    user_ids.length.times do |i|
      # 複数の同じユーザーを追加できないようにするための仕組み
      @group_user_relation = GroupUserRelation.find_by(group_id: group.id , user_id:user_ids[i])
      if @group_user_relation == nil
        GroupUserRelation.create(group_id: group.id , user_id: user_ids[i] , authority_id: authority_ids[i])
      end
    end
  end
end