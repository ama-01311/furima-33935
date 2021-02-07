require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '
      item_nameとitem_descriptionとitem_category_idとitem_state_idと
      delivery_side_idとdelivery_prefecture_idとdelivery_days_idと
      selling_priceとimageが揃っていれば出品できる
      ' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '画像が添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it '商品のカテゴリー選択がされていないと出品できない' do
        @item.item_category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category must be other than 1")
      end
      it '商品の状態が選択されていないと出品できない' do
        @item.item_state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state must be other than 1")
      end
      it '配送料の負担先が選択されていないと出品できない' do
        @item.delivery_side_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery side must be other than 1")
      end
      it '発送元の地域が選択されていないと出品できない' do
        @item.delivery_prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery prefecture must be other than 1")
      end
      it '発送までの日数が選択されていないと出品できない' do
        @item.delivery_days_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
      end
      it '販売価格が空だと出品できない' do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it '販売価格が半角数字でないと出品できない' do
        @item.selling_price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it '販売価格が¥300未満の数字だと出品できない' do
        @item.selling_price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
      end
      it '販売価格が¥9,999,999を超える数字だと出品できない' do
        @item.selling_price = "100000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
      end
    end
  end
end
