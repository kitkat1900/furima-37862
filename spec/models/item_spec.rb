require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image、item_name、description、category_id、condition_id、shipping_method_id、ships_from_id、shipping_date_id、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_method_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping method can't be blank"
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.ships_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Ships from can't be blank"
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank", 'Price には半角数字で¥300~¥9,999,999の間で入力してください'
      end
      it 'priceが300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price には半角数字で¥300~¥9,999,999の間で入力してください'
      end
      it 'priceが9999999より大きいと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price には半角数字で¥300~¥9,999,999の間で入力してください'
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price には半角数字で¥300~¥9,999,999の間で入力してください'
      end
      it 'priceが半角英字では登録できない' do
        @item.price = 'threehundred'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price には半角数字で¥300~¥9,999,999の間で入力してください'
      end
      it 'priceが半角英数混合では登録できない' do
        @item.price = '300hundred'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price には半角数字で¥300~¥9,999,999の間で入力してください'
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
