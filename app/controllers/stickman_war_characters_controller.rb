class StickmanWarCharactersController < ApplicationController
  def index
    
  end

  def show
    if params[:class_id] == "basic"
      @character = StickmanWarCharacterBasic.find(params[:character_id])
    elsif params[:class_id] == "supecial"

    elsif params[:class_id] == "super"
    end
    @next_character = find_character("plus" , params[:class_id])
    @before_character = find_character("minus" , params[:class_id])
  end

  private 

  def find_character (direction , class_name)
    if class_name == "basic"
      if direction == "plus"
        search_character = []
        roop_amount = 0;
        while search_character.length == 0
          # search_characterのlengthが０の間は該当するIDのキャラクターが見つかっていない
          roop_amount += 1
          search_character = StickmanWarCharacterBasic.like(id: params[:character_id].to_i + 1)
          if roop_amount >= 5
            # 5回繰り返しても見つからないとしたら、それはきっと最後のキャラクター
            return search_character = nil
          end
          if search_character.length != 0
            # search_characterが0ではないなら見つかったはず
            return search_character[0]
          end
        end

      elsif direction == "minus"
        search_character = []
        roop_amount = 0;
        while search_character.length == 0
          # search_characterのlengthが０の間は該当するIDのキャラクターが見つかっていない
          roop_amount += 1
          search_character = StickmanWarCharacterBasic.like(id: params[:character_id].to_i - 1)
          if roop_amount >= 5
            # 5回繰り返しても見つからないとしたら、それはきっと最後のキャラクター
            return search_character = nil
          end
          if search_character.length != 0
            # search_characterが0ではないなら見つかったはず
            return search_character[0]
          end
        end
      else
        binding.pry
      end
    elsif class_name == "supecial"

    elsif class_name == "supeer"

    end
  end
end
