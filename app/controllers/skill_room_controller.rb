class SkillRoomController < ApplicationController
  def index
    
  end

  def show
    if params[:type_id] == "html_css_explain"
      render "skill_room/explain/html_css"
    elsif params[:type_id] == "java_script_explain"
      render "skill_room/explain/javascript"
    elsif params[:type_id] == "ruby_on_rails_explain"
      render "skill_room/explain/ruby_on_rails"
    elsif params[:type_id] == "unity_explain"
      render "skill_room/explain/unity"
    # ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ここまでは言語の説明のリンク
    elsif params[:type_id] == "jquery_practice"
    elsif params[:type_id] == "javascript_explain"

    end
  end
end
