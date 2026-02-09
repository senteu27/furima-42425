require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録できない時' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスは一意性じゃないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@がないと登録できない' do
        @user.email = 'test.email'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字以上じゃないと登録できない' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは半角英数字混合じゃないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は数字と英語を含むようにしてください。')
      end
      it 'パスワードと確認用パスワードは一致してないと登録できない' do
        @user.password = 'aaaaa1'
        @user.password_confirmation = 'aaaaa2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は名字と名前どちらかが空だと登録できない' do
        @user.first_name = 'あ'
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
        @user.first_name = ''
        @user.last_name = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)はひらがな、カタカナ、漢字以外を使うと登録できない' do
        @user.first_name = 'a'
        @user.last_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name はひらがな、カタカナ、漢字のみで記入してください。',
                                                      'Last name はひらがな、カタカナ、漢字のみで記入してください。')
      end
      it 'お名前カナ(全角)は名字と名前どちらかが空だと登録できない' do
        @user.first_name_kana = 'ア'
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        @user.first_name_kana = ''
        @user.last_name_kana = 'ア'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)はカタカナ以外を使うと登録できない' do
        @user.first_name_kana = 'あ'
        @user.last_name_kana = '亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナで記入してください。', 'Last name kana はカタカナで記入してください。')
      end
      it '生年月日を入力してないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
    context 'ユーザー新規登録出来る時' do
      it '正しくニックネーム、パスワード、パスワード確認用、email、お名前(全角)、お名前カナ(全角)、生年月日を入力すると登録できる' do
        expect(@user).to be_valid
      end
    end
  end
end
