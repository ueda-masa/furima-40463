class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :name, presence: true
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :family_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角カタカナで入力してください" }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角カタカナで入力してください" }
  validates :birth_days, presence: true
  validate :password_complexity

  private

  def password_complexity
    return if password.blank?
  
    unless password.match(/\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/)
      errors.add :password, "は半角英字と数字の両方を含む必要があります"
    end
  end
end