class GroupsController < ApplicationController
  before_action :check_logined
  before_action :generate_message , :generate_group , :find_user , :set_boolean


  def index
  end

  def show
    @is_show = true
    @group = Group.find(params[:id])
    @group_user_relation = GroupUserRelation.find_by(user_id: current_user.id , group_id: @group.id)
    @authority = @group_user_relation.authority_id
  end

  def new
    @group_group_user_relation = GroupGroupUserRelation.new
    
    @nil_and_users = set_all_users
    @authorities = set_authorities(5)
  end

  def create
    @group_group_user_relation = GroupGroupUserRelation.new(group_group_user_relation_params)
    if @group_group_user_relation.valid?
      @group_group_user_relation.save
      redirect_to groups_path
    else
      @authorities = set_authorities(5)
      @nil_and_users = set_all_users
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    @is_edit = true
    @group_user_relation = GroupGroupUserRelation.find_by()
  end

  def update
    
  end

  def destroy
    
  end

  private 

  def set_all_users
    nil_and_users = []
    nil_user = User.new
    users = User.where.not(id: current_user.id)
    nil_and_users.push(nil_user)
    users.each do |user|
      nil_and_users.push(user)
    end
    return nil_and_users
  end

  def set_authorities(authority_level)
    authorities = []
    (authority_level-1).times do |i|
      authorities.unshift(Authority.data.detect{|o| o[:id] == i + 1})
    end
    return  authorities
  end

  def check_logined
    if !user_signed_in?
      render "shared/prease_login"
    end 
  end

  def generate_group
    @group = Group.new
  end

  def generate_message
    @message = Message.new
  end

  def find_user
    @user = User.find(current_user.id)
  end

  def group_group_user_relation_params
    params.require(:group_group_user_relation).permit(:name , :explain , user_ids: [] , authority_ids: [])
  end

  def set_boolean 
    @is_show = false
    @is_edit = false
    @is_group = true
  end

end
