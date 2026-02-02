require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it "ニックネームが空では登録できない" do
    end
    it "メールアドレスが空では登録できない" do
    end
    it "メールアドレスは一意性じゃないと登録できない" do
    end
    it "メールアドレスに@がないと登録できない" do
    end
    it "パスワードが空だと登録できない" do
    end
    it "パスワードが6文字以上じゃないと登録できない" do
    end
    it "パスワードは半角英数字混合じゃないと登録できない" do
    end
    it "パスワードと確認用パスワードは一致してないと登録できない" do
    end
  end
end