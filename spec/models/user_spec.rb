require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,last,first_name(カナも含め),birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上かつであれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれてなければ登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '英語のみでは登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end

      it '苗字（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it '名前（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it '苗字（全角）が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name Full-width characters'
      end
      it '名前（全角）が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name Full-width characters'
      end
      it '苗字（カナ）が空だと登録できない' do
        @user.last_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana name can't be blank"
      end
      it '名前（カナ）が空だと登録できない' do
        @user.first_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana name can't be blank"
      end
      it '苗字（カナ）がカタカナでないと登録できない' do
        @user.last_kana_name = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last kana name Full-width katakana characters'
      end
      it '名前（カナ）がカタカナでないと登録できない' do
        @user.first_kana_name = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First kana name Full-width katakana characters'
      end

      it '誕生日が空だと登録できない' do
        @user.birthday = '--'
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
