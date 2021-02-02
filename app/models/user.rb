class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :lname_full_width, presence: true
  validates :fname_full_width, presence: true
  validates :lname_kana, presence: true
  validates :fname_kana, presence: true
  validates :birth_date, presence: true
end
