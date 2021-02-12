class OrderAddress
  include ActiveModel::Model
  attr_accessor :delivery_post_number, :delivery_prefecture_id, :delivery_municipality, :delivery_address, :delivery_building, :phone_number, :order_id, :user_id, :item_id,
                :token
                

  with_options presence: true do
    validates :delivery_post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_municipality
    validates :delivery_address
    validates :phone_number, length: { maximum: 75 }, numericality: :only_integer

    validates :user_id
    validates :item_id

  end
  validates :delivery_prefecture_id, numericality: {other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(delivery_post_number: delivery_post_number, delivery_municipality: delivery_municipality, 
                   delivery_address: delivery_address,delivery_prefecture_id: delivery_prefecture_id, delivery_building: delivery_building, 
                   phone_number: phone_number, order_id: order.id)
  end

end