require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 1
    end

    context '商品購入できる場合' do
      it 'delivery_post_numberとdelivery_prefecture_idとdelivery_municipalityと
          delivery_addressとdelivery_buildingとphone_numberとtokenがある時' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'delivery_post_numberが空の場合' do
        @order_address.delivery_post_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery post number can't be blank")
      end
      it 'delivery_post_numberに-（ハイフン）が入っていない場合' do
        @order_address.delivery_post_number = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Delivery post number is invalid. Include hyphen(-)')
      end
      it 'delivery_prefecture_idが１の場合' do
        @order_address.delivery_prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Delivery prefecture must be other than 1')
      end
      it 'delivery_municipalityが空の場合' do
        @order_address.delivery_municipality = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery municipality can't be blank")
      end
      it 'delivery_addressが空の場合' do
        @order_address.delivery_address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery address can't be blank")
      end
      it 'phone_numberが空の場合' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角英字がある場合' do
        @order_address.phone_number = 'a1111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberに全角文字がある場合' do
        @order_address.phone_number = 'あ1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'tokenが空の場合' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
