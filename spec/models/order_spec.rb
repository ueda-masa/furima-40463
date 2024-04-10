require 'rails_helper'
require 'faker'

RSpec.describe OrderForm, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user) # Userを作成して
      @order_form = FactoryBot.build(:order_form, user_id: @user.id) # user_idを渡す
    end

    # 正常系
    context '正常に登録できる場合' do
      it '全ての情報が正しく入力されていれば保存できること' do
        @order_form.item_id = FactoryBot.create(:item).id
        expect(@order_form).to be_valid
      end
    end

    # 異常系
    context '正常に登録できない場合' do
      context 'userが紐づいていない場合' do
        it 'userが紐づいていなければ保存できないこと' do
          @order_form.user_id = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("User can't be blank")
        end
      end

      context 'itemが紐づいていない場合' do
        it 'itemが紐づいていなければ保存できないこと' do
          @order_form.item_id = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Item can't be blank")
        end
      end

      context '郵便番号' do
        it '郵便番号が空だと保存できないこと' do
          @order_form.postal_code = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
        end

        it '郵便番号は、「7桁以下」の場合保存できない' do
          @order_form.item = FactoryBot.create(:item) # itemを明示的に設定する
          @order_form.postal_code = '123-123'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Postal code is invalid.")
        end
      end

      context '都道府県' do
        it '都道府県が空だと保存できないこと' do
          @order_form.prefecture_id = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
        end
      end

      context '市区町村' do
        it '市区町村が空だと保存できないこと' do
          @order_form.city = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("City can't be blank")
        end
      end

      context '番地' do
        it '番地が空だと保存できないこと' do
          @order_form.address = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Address can't be blank")
        end
      end

      context '電話番号' do
        it '電話番号が空だと保存できないこと' do
          @order_form.phone_number = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号は、9桁以下の場合は保存できない' do
          @order_form.item = FactoryBot.create(:item) # itemを明示的に設定する
          @order_form.phone_number = '090123456'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number is too short")
        end
      end
    end
  end
end


