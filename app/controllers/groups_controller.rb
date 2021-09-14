class GroupsController < ApplicationController
  before_action :check_logined
  before_action :generate_message , :generate_group , :find_user , :set_boolean
  before_action :get_group_from_params , :check_belongs_to_group , only: [:edit , :show]


  def index
  end

  def show
    @is_show = true
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
    @is_edit = true
    @group_user_relation = GroupUserRelation.find_by(group_id: @group.id , user_id: current_user.id)
    @nil_and_users = set_can_add_users
    @authority = @group_user_relation.authority_id
    @send_group_user_relation = GroupUserRelation.new
    @authorities = set_authorities(@group_user_relation.authority_id)
  end

  def update
    
  end

  def destroy
    @group_user_relation = GroupUserRelation.find_by(user_id: current_user.id , group_id: params[:id])
    binding.pry
    @group = Group.find(params[:id])
    if @group_user_relation.authority_id == 5
      @group.destroy
    end
    redirect_to groups_path
  end

  private 

  def get_group_from_params
    @group = Group.find(params[:id])
  end

  def set_can_add_users
    nil_and_users = []
    nil_user = User.new
    users = User.where.not(id: current_user.id)
    nil_and_users.push(nil_user)
    users.each do |user|
      if is_can_add_member(user)
        nil_and_users.push(user)
      end
    end
    return nil_and_users
  end

  def is_can_add_member(user)
    @group.users.each do |user_in_group|
      if user_in_group == user
        return false
      end
    end
    return true
  end

  def check_belongs_to_group
    if !is_belongs_to_group
      redirect_to groups_path
    end
  end

  def is_belongs_to_group
    @group.users.each do |user|
      if user == current_user
        return true
      end
    end
    false
  end

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
