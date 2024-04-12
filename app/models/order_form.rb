class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do  
    validates :user_id, :item_id 
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid." }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, presence: { message: "can't be blank" }
    validates :address, presence: { message: "can't be blank" }
    validates :phone_number, presence: { message: "can't be blank" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }, length: { minimum: 10, message: "is too short" }, if: Proc.new { |a| a.phone_number.present? }
    validates :token, presence:{ message: "can't be blank" }
  end



  def prefecture
    Prefecture.find(prefecture_id)
  end

  def save
    ActiveRecord::Base.transaction do
      order = Order.create(user_id: user_id, item_id: item_id, token: token)
      if order.valid?
        Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
      else
        return false
      end
    end
    true
  end
  
  def item=(item)
    self.item_id = item.id
  end
end






