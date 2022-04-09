require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end 
  
  describe '商品購入情報の保存' do
    context '内容に問題が無い場合は保存が出来る' do
      it '全ての値が正しく入力されている' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは無くても保存出来る' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end    
    end

    context '内容に問題がある場合は保存出来ない' do
      it 'post_codeは空では保存出来ない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが3桁ハイフン4桁でなければ保存出来ない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では保存出来ない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipulitiesが空では保存出来ない' do
        @order_address.municipulities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipulities can't be blank")
      end
      it 'block_number が空では保存出来ない' do
        @order_address.block_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block number can't be blank")
      end
      it 'phone_numberが空では保存出来ない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは10桁以上11桁以内でなければ保存出来ない' do
        @order_address.phone_number = '12345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは半角数値でなければ保存出来ない' do
        @order_address.phone_number = '１２３４５６７８９１０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end


    end


  
  end


end

