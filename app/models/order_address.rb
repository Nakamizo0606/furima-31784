class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality 
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{11}+\z/i, message: "is invalid. Input half-width characters."}
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
   order = Order.create(item_id: item_id, user_id: user_id)
   Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    
   
  end
end