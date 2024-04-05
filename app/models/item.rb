class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :condition 
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  belongs_to :user
  has_one_attached :image

  validates :image, presence: { message: "can't be blank" }
  validates :name, presence: { message: "can't be blank" }
  validates :description, presence:  { message: "can't be blank" }
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "must be other than 1"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "must be other than 1" }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1 , message: "must be other than 1" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "must be other than 1"}
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 , message: "must be other than 1" }
  validates :price, presence: true, numericality: { only_integer: true, message: "is not a number" }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: "must be greater than or equal to 300" }
  validates :price, numericality: { less_than_or_equal_to: 9999999, message: "must be less than or equal to 9999999" }
end

