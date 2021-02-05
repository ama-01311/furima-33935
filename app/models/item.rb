class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
    belongs_to :item_category
    belongs_to :item_state
    belongs_to :delivery_side
    belongs_to :delivery_prefecture
    belongs_to :delivery_days
  

  belongs_to :user
  has_one_attached :image

  with_options numericality: {other_than: 1} do
    validates :item_category
    validates :item_state
    validates :delivery_side
    validates :delivery_prefecture
    validates :delivery_days
  end
  

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
