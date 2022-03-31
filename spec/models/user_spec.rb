require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthがあれば登録出来る' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
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
      it '重複したemailが存在する場合は登録出来ない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英数混合出ないと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは全角では登録できない' do
        @user.password = '１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
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
      it 'last_nameに半角文字が含まれている時は登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameに半角文字が含まれている時は登録できない' do
        @user.first_name = 'taro'
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaがカタカナ意外では登録できない' do
        @user.last_name_kana = '山田'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'first_name_kanaがカタカナ意外では登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
