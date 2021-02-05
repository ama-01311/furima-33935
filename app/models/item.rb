class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :item_category_id
    validates :item_state_id
    validates :delivery_side_id
    validates :delivery_prefecture_id
    validates :delivery_days_id
    validates :image

    validates :selling_price #format: { with: /\A(?=.*?[\d])[a-z\d]+\z/i, message: "半角数字で入力してください"}
  end

end
