require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録ができるとき" do
    it "image_name , explain以外の全てが揃っているとき" do
      @user.image_name = nil
      @user.explain = nil
      expect(@user).to be_valid
    end

    it "account_nameが重複しても保存できる" do
      @other_user = FactoryBot.create(:user)
      @user.account_name = @other_user.account_name
      @user.valid?
      expect(@user).to be_valid
    end

  end

  describe "新規登録ができないとき" do
    it "nicknameが空の時" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it "account_nameが空の時" do
      @user.account_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("アカウント名を入力してください")
    end

    it "rankが空の時" do
      @user.rank = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザーランクを入力してください")
    end

    it "pointが空の時" do
      @user.point = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ポイントを入力してください")
    end

    it "emailが空の時" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it "すでに保存されているemailと重複する時" do
      @other_user = FactoryBot.create(:user)
      @user.email = @other_user.email
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it "passwordが空の時" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "password_confirmationがpasswordと一致しないとき" do
      @user.password_confirmation = "nil"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

  end

  describe "情報更新ができるとき" do
    before do
      @user = FactoryBot.create(:user)
    end

    it "explain , image_name以外の全てが揃っているとき" do
      @user.explain = nil
      @user.image_name = nil
      expect(@user).to be_valid
    end

  end

  describe "情報更新ができないとき" do
    before do
      @user = FactoryBot.create(:user)
    end

    it "nicknameが空の時" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it "account_nameが空の時" do
      @user.account_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("アカウント名を入力してください")
    end

    it "account_nameが既にいるユーザーと重複するとき" do
      @other_user  = FactoryBot.create(:user)
      @user.account_name = @other_user.account_name
      @user.valid?
      expect(@user.errors.full_messages).to include("アカウント名はすでに存在します")
    end

    it "rankが空の時" do
      @user.rank = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザーランクを入力してください")
    end

    it "pointが空の時" do
      @user.point = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ポイントを入力してください")
    end

    it "emailが空の時" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it "passwordが空の時" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "password_confirmationがpasswordと一致しないとき" do
      @user.password_confirmation = "nil"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end
