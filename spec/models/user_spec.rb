require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    # 正常系
    context '正常に登録できる場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    # 異常系
    context '正常に登録できない場合' do
      context '名前' do
        it 'nameが空では登録できない' do
         @user.name = ''
         @user.valid?
         expect(@user.errors.full_messages).to include "Name can't be blank"
        end
      end

      context 'メールアドレス' do
        it 'emailが空では登録できない' do
         @user.email = ''
         @user.valid?
         expect(@user.errors.full_messages).to include "Email can't be blank"
        end

        it '重複したメールアドレスは登録できない' do
          FactoryBot.create(:user, email: @user.email)
          @user.valid?
          expect(@user.errors.full_messages).to include 'Email has already been taken'
        end

        it 'メールアドレスに@を含まない場合は登録できない' do
          @user.email = 'testexample.com'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Email is invalid'
        end
      end

      context 'パスワード' do
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Password can't be blank"
        end

        it 'パスワードが6文字未満では登録できない' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
       end

        it '英字のみのパスワードでは登録できない' do
          @user.password = 'password'
          @user.password_confirmation = 'password'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password は半角英字と数字の両方を含む必要があります'
        end

        it '数字のみのパスワードでは登録できない' do
          @user.password = 'パスワード１２３'
          @user.password_confirmation = 'パスワード１２３'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password は半角英字と数字の両方を含む必要があります'
        end

        it '全角文字を含むパスワードでは登録できない' do
          @user.password = 'パスワード１２３abc'
          @user.password_confirmation = 'パスワード１２３abc'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password は半角英字と数字の両方を含む必要があります'
        end

        it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
          @user.password_confirmation = 'password123'
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
        end
      end

      context '姓・名（漢字）' do
        it 'family_name_kanjiが空では登録できない' do
          @user.family_name_kanji = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name kanji can't be blank"
        end
      
        it 'first_name_kanjiが空では登録できない' do
          @user.first_name_kanji = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "First name kanji can't be blank"
        end

        it '姓（漢字）に半角文字が含まれていると登録できない' do
          @user.family_name_kanji = 'Yamada'
          @user.valid?
         expect(@user.errors.full_messages).to include 'Family name kanji は全角（漢字・ひらがな・カタカナ）で入力してください'
        end
      
        it '名（漢字）に半角文字が含まれていると登録できない' do
          @user.first_name_kanji = 'Taro'
          @user.valid?
         expect(@user.errors.full_messages).to include 'First name kanji は全角（漢字・ひらがな・カタカナ）で入力してください'
        end
      end

      context '姓・名（カナ）' do
        it 'family_name_kanaが空では登録できない' do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Family name kana can't be blank"
        end
      
       it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "First name kana can't be blank"
        end

        it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
          @user.family_name_kana = 'やまだ'
          @user.valid?
         expect(@user.errors.full_messages).to include 'Family name kana は全角カタカナで入力してください'
        end
      
        it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
          @user.first_name_kana = 'たろう'
          @user.valid?
          expect(@user.errors.full_messages).to include 'First name kana は全角カタカナで入力してください'
        end
      end

      context '生年月日' do
        it 'birth_daysが空では登録できない' do
          @user.birth_days = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Birth days can't be blank"
        end
      end

    end
  end
end



