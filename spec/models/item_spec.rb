require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品作成' do
    context '出品作成できるとき' do
      it '全ての項目を適切に入力すると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品作成できないとき' do
      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '名前が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '説明が空だと登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explain can't be blank"
      end
      it 'カテゴリーが空だと登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it '商品の状態が空だと登録できない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition Select'
      end
      it '配送料の負担が空だと登録できない' do
        @item.post_type = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Post type Select'
      end
      it '発送元の地域が空だと登録できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture Select'
      end
      it '発送までの日数が空だと登録できない' do
        @item.preparation_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Preparation day Select'
      end
      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が半角数字以外だと登録できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
      it '価格が範囲外だと登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
    end
  end
end
