class GroupsController < ApplicationController
  before_action :generate_message , :generate_room 


  def index
    
  end

  def show
    
  end

  def new
    
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

  def generate_room
    @room = Room.new
  end

  def generate_message
    @message = Message.new
  end

end
