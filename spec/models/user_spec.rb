require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'emailに＠がないと登録できないこと' do
      @user.email = "@"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
      

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが半角英字のみでは登録できないこと' do
      @user.password = "aaaaaaa"
      @user.password_confirmation = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'passwordが6文字以下では登録できない' do
      @user.password = 'aa000'
      @user.password_confirmation = 'aa000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数混合でなければ登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'passwordとpassword_confirmationが一致しなければ登録できない' do
      @user.password = 'aaaaa000'
      @user.password_confirmation = 'aaaa000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'ユーザー本名が漢字、ひらがな、カタカナでなければ登録できない' do
      @user.last_name = '000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name に全角文字を使用してください")
    end

    it 'ユーザー本名のフリガナは全角（カタカナ）でないと登録できない' do
      @user.frigana_first_name = "漢字"
      @user.frigana_last_name = "漢字"
      @user.valid?
      expect(@user.errors.full_messages).to include("Frigana first name is invalid","Frigana last name is invalid")
    end

    it 'frigana_first_nameが空では登録できない' do
      @user.frigana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Frigana first name can't be blank")
    end

    it 'frigana_last_nameが空では登録できない' do
      @user.frigana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Frigana last name can't be blank")
    end

    it '生年月日が空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
