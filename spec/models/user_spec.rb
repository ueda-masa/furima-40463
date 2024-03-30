require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.name = ''  # nameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Name can't be blank"
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.password = ''  # passwordの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end
    it 'first_name_kanjiが空では登録できない' do
      user = FactoryBot.build(:user, first_name_kanji: '')  # Userのインスタンス生成
      user.valid?
      expect(user.errors.full_messages).to include "First name kanji can't be blank"
    end

    it 'family_name_kanjiが空では登録できない' do
      user = FactoryBot.build(:user, family_name_kanji: '')  # Userのインスタンス生成
      user.valid?
      expect(user.errors.full_messages).to include "Family name kanji can't be blank"
    end

    it 'first_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user, first_name_kana: '')  # Userのインスタンス生成
      user.valid?
      expect(user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'family_name_kanaが空では登録できない' do
      user = FactoryBot.build(:user, family_name_kana: '')  # Userのインスタンス生成
      user.valid?
      expect(user.errors.full_messages).to include "Family name kana can't be blank"
    end

    it 'birth_daysが空では登録できない' do
      user = FactoryBot.build(:user, birth_days: '')  # Userのインスタンス生成
      user.valid?
      expect(user.errors.full_messages).to include "Birth days can't be blank"
    end
  end
end

