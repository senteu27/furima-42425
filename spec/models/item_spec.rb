require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品出品ができない時" do
      it "商品画像が空だと出品できない" do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品の名前が空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空だと出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーが1だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が1だと出品できない" do
        @item.condition_description_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition description can't be blank")
      end
      it "配送料が1だと出品できない" do
        @item.shipping_prise_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping prise can't be blank")
      end
      it "発送元が1だと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数が1だと出品できない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "商品の価格が300未満だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "商品の価格が9999999" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "価格は半角数字じゃないと出品できない" do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end
