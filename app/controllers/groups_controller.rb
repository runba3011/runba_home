class GroupsController < ApplicationController
  before_action :check_logined
  before_action :generate_message , :generate_group , :find_user


  def index
  end

  def show
    @is_show = true
    @group = Group.find(params[:id])
  end

  def new
    @group_group_user_relation = GroupGroupUserRelation.new
    @users = User.where.not(id: current_user.id)
    @authorities = []
    4.times do |i|
      @authorities.unshift(Authority.data.detect{|o| o[:id] == i + 1})
    end
  end

  def create
    @group_group_user_relation = GroupGroupUserRelation.new(group_group_user_relation_params)
    if @group_group_user_relation.valid?
      @group_group_user_relation.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private 

  def check_logined
    if !user_signed_in?
      redirect_to users_path
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
  end

end
