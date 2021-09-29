class SkillRoomController < ApplicationController
  def index
    
  end

  def show
    if params[:type_id] == "html_css_explain"
      @html_css_explain = true;
    elsif params[:type_id] == "java_script_explain"
      @javascript_explain = true;
    elsif params[:type_id] == "ruby_on_rails_explain"
      @ruby_on_rails_explain = true;
    elsif params[:type_id] == "unity_explain"
      @unity_explain = true;
    # ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ここまでは言語の説明のリンク
    elsif params[:type_id] == "jquery_practice"
    elsif params[:type_id] == "javascript_explain"

    end
  end
end
