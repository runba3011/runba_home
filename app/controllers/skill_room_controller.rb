class SkillRoomController < ApplicationController
  def index
    
  end

  def show
    # 言語説明のリンク部分
    if params[:type_id] == "html_css_explain"
      @html_css_explain = true
    elsif params[:type_id] == "java_script_explain"
      @javascript_explain = true
    elsif params[:type_id] == "ruby_on_rails_explain"
      @ruby_on_rails_explain = true
    elsif params[:type_id] == "unity_explain"
      @unity_explain = true
      
    # jQueryの練習をしていた部分
    elsif params[:type_id] == "jquery_practice"
      @jquery_practice = true

    # スクリプトを使用して無駄な画面の変化を加えて遊ぶ部分
    elsif params[:type_id] == "skill_play_room"
      @skill_play_room = true

    end
  end
end
