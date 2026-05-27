class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can' t be blank"}
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/,message: "is invalid"}
    validates :token
  end

    def save

    order =Order.create(user_id: user_id, item_id: item_id)

    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, 
    street_address: street_address, building_name: building_name, 
    telephone_number: telephone_number, order_id: order.id)
  end
end
