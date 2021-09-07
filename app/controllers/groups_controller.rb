class GroupsController < ApplicationController
  before_action :check_logined
  before_action :generate_message , :generate_group 


  def index
    
  end

  def show
    
  end

  def new
    @users = User.where.not(id: current_user.id)
    @authorities = []
    4.times do |i|
      @authorities.unshift(Authority.data.detect{|o| o[:id] == i + 1})
    end
  end

  def create
    
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

end
