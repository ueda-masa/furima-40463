require 'rails_helper'
require 'faker'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do
      # OrderのFactoryで必要な値を設定
      @order = FactoryBot.build(:order)
    end
    

    # 正常系
    context '正常に登録できる場合' do
      it '全ての情報が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
    end

    # 異常系
    context 'userが紐づいていない場合' do
      it 'userが紐づいていなければ保存できないこと' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User must exist")
      end
    end

    context 'itemが紐づいていない場合' do
      it 'itemが紐づいていなければ保存できないこと' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item must exist")
      end
    end
  end
end

RSpec.describe OrderForm, type: :model do
    describe 'OrderForm' do
      before do
        @order_form = FactoryBot.build(:order_form)
      end

      # 異常系
      context '正常に登録できない場合' do
        context 'userが紐づいていない場合' do
          it 'userが紐づいていなければ保存できないこと' do
            @order_form.user = nil
            @order_formr.valid?
            expect(@order_form.errors.full_messages).to include("User must exist")
          end
        end
    
        context 'itemが紐づいていない場合' do
          it 'itemが紐づいていなければ保存できないこと' do
            @order_form.item = nil
            @order_form.valid?
            expect(@order_form.errors.full_messages).to include("Item must exist")
          end
        end


        context '郵便番号' do
          it '郵便番号が空だと保存できないこと' do
            @order_form.postal_code = nil
            @order_form.valid?
            expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
          end
      
          it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
            @order_form.postal_code = '123-4567'
            @order_form.valid?
            expect(@order_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
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

          it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
            @order_form.phone_number = '09012345678'
            @order_form.valid?
            expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number")
          end
        end
      end
    end
end