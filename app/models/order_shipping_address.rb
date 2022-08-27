class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :city
    validates :address
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid"}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save

    order = Order.create(user_id: user_id, item: item_id)

    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building: building, phone_number: phone_number, order_id: order.id)
  end
end