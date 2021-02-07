class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_state
  belongs_to :delivery_side
  belongs_to :delivery_prefecture
  belongs_to :delivery_days

  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 1 } do
    validates :item_category_id
    validates :item_state_id
    validates :delivery_side_id
    validates :delivery_prefecture_id
    validates :delivery_days_id
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
    validates :selling_price, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' },
                              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
