require 'rails_helper'
require 'faker'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

        # 正常系
        context '正常に登録できる場合' do
    it '全ての情報が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

       # 異常系
  context '正常に登録できない場合' do

    context '商品画像' do
      it '商品画像が空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

    context '商品名' do
      it '商品名が空だと保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

    context '商品の説明' do
      it '商品の説明が空だと保存できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

    context 'カテゴリー' do
      it 'カテゴリーが空だと保存できないこと' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

    context '商品の状態' do
      it '商品の状態が空だと保存できないこと' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

    context '配送料の負担' do    
      it '配送料の負担が空だと保存できないこと' do
        @item.shipping_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

    context '発送元の地域' do  
      it '発送元の地域が空だと保存できないこと' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

    context '発送までの日数' do        
      it '発送までの日数が空だと保存できないこと' do
        @item.shipping_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

    context '価格の情報' do  
      it '価格が空だと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

    it '価格が300未満だと保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '価格が9999999より大きいと保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '価格が半角数字以外だと保存できないこと' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end

