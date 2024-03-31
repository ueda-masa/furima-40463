class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :family_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: "は全角カタカナで入力してください" }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/, message: "は全角カタカナで入力してください" }
  validates :birth_days, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数字混合で入力してください" }



end

