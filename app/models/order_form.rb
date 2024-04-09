class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do  
    validates :user_id, :item_id 
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "Postal code is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "Prefecture can't be blank" }
    validates :city, presence: { message: "City can't be blank" }
    validates :address, presence: { message: "Addresses can't be blank" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Phone number is invalid. Input only number" }
    validates :phone_number, length: { minimum: 10, message: "Phone number is too short" }
  end

  def prefecture
    Prefecture.find(prefecture_id)
  end

  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end




