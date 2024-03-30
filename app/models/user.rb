class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name_kanji, presence: true
  validates :first_name_kana, presence: true
  validates :family_name_kana, presence: true
  validates :birth_days, presence: true

  has_many :items
  has_many :orders

end
