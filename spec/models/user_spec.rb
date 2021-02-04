require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emaiに＠がないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email @を入力してください')
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが６文字以上でないと登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字を混合して入力してください")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字を混合して入力してください")
      end
      it 'passwordが全角文字では登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字を混合して入力してください")
      end
      it 'passwordとpassword(確認用)は値が一致していないと登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名の名字が空では登録できない' do
        @user.lname_full_width = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lname full width can't be blank")
      end
      it 'ユーザー本名の名前が空では登録できない' do
        @user.fname_full_width = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Fname full width can't be blank")
      end
      it 'ユーザー本名は名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.lname_full_width = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lname full width 全角文字を使用してください')
      end
      it 'ユーザー本名は名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.fname_full_width = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Fname full width 全角文字を使用してください')
      end
      it 'ユーザー本名フリガナは名字が空では登録できない' do
        @user.lname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lname kana can't be blank")
      end
      it 'ユーザー本名フリガナは名前が空では登録できない' do
        @user.fname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Fname kana can't be blank")
      end
      it 'ユーザー本名の名字のフリガナは、半角文字だと登録できない' do
        @user.lname_kana = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lname kana 全角（カタカナ）を使用してください")
      end
      it 'ユーザー本名の名字のフリガナは、全角（カタカナ）でないと登録できない' do
        @user.lname_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lname kana 全角（カタカナ）を使用してください")
      end
      it 'ユーザー本名の名前のフリガナは、半角文字だと登録できない' do
        @user.fname_kana = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Fname kana 全角（カタカナ）を使用してください")
      end
      it 'ユーザー本名の名前のフリガナは、全角（カタカナ）でないと登録できない' do
        @user.fname_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Fname kana 全角（カタカナ）を使用してください")
      end
      it '生年月日が空だと登録できない' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end

    context 'ユーザー新規登録できる場合' do
      it 'passwordが６文字以上入力されていれば登録できる' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a123456'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字が混合されていれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
    end
  end
end
