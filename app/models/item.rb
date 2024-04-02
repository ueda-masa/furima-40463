class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category_id

 belongs_to :user
 belongs_to :prefecture
 
 validates :name, presence: true
 validates :description, presence: true
 validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
 validates :condition_id, presence: true
 validates :shipping_charge_id, presence: true
 validates :prefecture_id, presence: true
 validates :shipping_day_id, presence: true
 validates :price, presence: true

end



