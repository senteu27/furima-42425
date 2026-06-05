require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できない時' do
      it '郵便番号が空では購入できない' do
        @order_destination.postal_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが含まれていないと購入できない' do
        @order_destination.postal_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号が全角では購入できない' do
        @order_destination.postal_code = '１２３４-５６７'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が1では購入できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村区が空では購入できない' do
        @order_destination.municipalities = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では購入できない' do
        @order_destination.street_address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_destination.telephone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号は半角数字のみじゃないと購入できない' do
        @order_destination.telephone_number = '090-1234-5678'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が全角では購入できない' do
        @order_destination.telephone_number = '０９０１２３４５６７８'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が10桁未満では購入できない' do
        @order_destination.telephone_number = '090123456'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が12桁以上では購入できない' do
        @order_destination.telephone_number = '0120123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'トークンがないと購入できない' do
        @order_destination.token = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
    context '商品購入できるとき' do
      it '必要な情報を入力すれば購入できる' do
        expect(@order_destination).to be_valid
      end
      it '建物名はなくても購入できる' do
        @order_destination.building_name = ''
        expect(@order_destination).to be_valid
      end
    end
  end
end
