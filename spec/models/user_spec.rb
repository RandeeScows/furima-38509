require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '全項目あれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      #nickname
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      #email
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在すれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '@を含まないemailは登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      #password
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = Faker::Lorem.words(number:6)
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it '全角を含むpasswordは登録できない' do
        @user.password = 'あ111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = Faker::Number.number(digits: 6)
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが異なれば登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      #family_name, given_name
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it '半角が含まれるfamily_nameは登録できない' do
        @user.family_name = 'A田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 氏名には全角文字を使用してください')
      end
      it 'given_nameが空では登録できない' do
        @user.given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end
      it '半角が含まれるgiven_nameは登録できない' do
        @user.given_name = 'A子'
        @user.valid?
        expect(@user.errors.full_messages).to include('Given name 氏名には全角文字を使用してください')
      end

      #phonetic_fn, phonetic_gn
      it 'phontic_fnが空では登録できない' do
        @user.phonetic_fn = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phonetic fn can't be blank")
      end
      it 'phontic_fnがカタカナ以外を含むと登録できない' do
        @user.phonetic_fn = 'Aア'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phonetic fn 読み仮名には全角カタカナを使用してください')
      end

      it 'phontic_gnが空では登録できない' do
        @user.phonetic_gn = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phonetic gn can't be blank")
      end
      it 'phontic_gnがカタカナ以外を含むと登録できない' do
        @user.phonetic_gn = 'Aア'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phonetic gn 読み仮名には全角カタカナを使用してください')
      end

      #birthday
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")  
      end
    end
  end
end

