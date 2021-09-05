require 'rails_helper'

RSpec.describe StickmanWarComment, type: :model do
  before do
    @comment = FactoryBot.build(:stickman_war_comment)
  end 

  describe "コメント投稿ができるとき" do
    it "text,stage_type,stage_idが揃っており、userと紐づいているとき" do
      expect(@comment).to be_valid
    end
  end

  describe "コメント投稿ができないとき" do
    it "textが空のとき" do
      @comment.text = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("テキストを入力してください")
    end

    it "stage_typeが空のとき" do
      @comment.stage_type = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("ステージタイプを入力してください")
    end

    it "stage_idが空のとき" do
      @comment.stage_id = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("ステージIDを入力してください")
    end

    it "userと紐づいていないとき" do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("ユーザーを入力してください")
    end
  end
end
