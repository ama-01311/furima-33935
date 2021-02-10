class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_date
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :lname_full_width
    validates :fname_full_width
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角（カタカナ）を使用してください' } do
    validates :lname_kana
    validates :fname_kana
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字を混合して入力してください' }

  has_many :items
  has_many :orders
end
