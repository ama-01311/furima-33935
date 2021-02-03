require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
      
    end
    it "emailが空だと登録できない" do
    end
    it "emailが重複していると登録できない" do
    end
    it "emaiに＠がないと登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "passwordが６文字以上でないと登録できない" do
    end
    it "passwordに半角英数字が混合されていないと登録できない" do
    end
    it "passwordは確認用を含めて2回登録しなければいけない" do
    end
    it "passwordとpassword(確認用)は値が一致していないと登録できない" do
    end
  end
end
