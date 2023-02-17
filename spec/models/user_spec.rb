require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # context '新規登録ができる場合' do
      # it "nickname、email、password、password_confirmation、family_name、given_name、phonetic_fn、phonetic_gn, birthday があれば登録できる" do
      # end
    # end

    context '新規登録できない場合' do
      # it "nicknameが空では登録できない" do
      #  @user.nickname = ''
      #  @user.valid?
      #  expect(@user.errors.full_messages).to include("Nickname can't be blank")
      # end

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

      # it 'password_confirmationが空では登録できない' do
      #  @user.password_confirmation = ''
      #  @user.valid?
      #  expect(@user.error.full_messages).to include("Password confirmation can't be blank")
      # end

      it 'passwordとpassword_confirmationが異なれば登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      # it "family_nameが空では登録できない" do
      # end
      # it "given_nameが空では登録できない" do
      # end
      # it "phontic_fnが空では登録できない" do
      # end
      # it "phontic_gnが空では登録できない" do
      # end
      # it "birthdayが空では登録できない" do
      # end
    end
  end
end

