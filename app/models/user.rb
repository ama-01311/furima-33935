class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true  do
    validates :nickname
    validates :birth_date
    validates :lname_full_width, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
    validates :fname_full_width, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
    validates :lname_kana, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角（カタカナ）を使用してください' }
    validates :fname_kana, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角（カタカナ）を使用してください' }
  end

  validates :email, format: { with: /@.+/, message: '@を入力してください' }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字を混合して入力してください' }
end
