class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :delivery_post_number
    validates :delivery_prefecture_id, numericality: {other_than: 1 }
    validates :delivery_municipality
    validates :delivery_address
    validates :phone_number
  end

end
