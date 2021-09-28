class StickmanWarCharactersController < ApplicationController
  def index
    
  end

  def show
    if params[:class_id] == "basic"
      @character = StickmanWarCharacterBasic.find(params[:character_id])
    elsif params[:class_id] == "supecial"
    elsif params[:class_id] == "super"
    end
  end
end
