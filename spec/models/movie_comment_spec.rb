require 'rails_helper'

RSpec.describe MovieComment, type: :model do
  
  before do
    @comment = FactoryBot.build(:movie_comment)
  end
  
  describe "コメント投稿ができるとき" do
    it "コメントの内容があり、ユーザーテーブルと結びついており、動画のIDが含まれているとき" do
      expect(@comment).to be_valid
    end
  end

  describe "コメント投稿ができないとき" do
    it "textが空のとき" do
      @comment.text = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("コメント文を入力してください")
    end

    it "textが1000文字以上のとき" do
      @comment.text  =nil
      1001.times do 
        @comment.text = "#{@comment.text}a"
      end
      @comment.valid?
      expect(@comment.errors.full_messages).to include("コメント文は1000文字以内で入力してください")
    end

    it "Usersテーブルと紐づいていないとき" do
      @comment.user =nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("ユーザーを入力してください")
    end

    it "Movieモデルと紐づいていないとき" do
      @comment.movie =nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("動画を入力してください")
    end
  end
end
