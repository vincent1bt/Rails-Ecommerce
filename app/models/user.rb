class User < ApplicationRecord
  include UserAuth

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, length: { minimum: 8 }

  has_many :products
  has_many :my_payments
end
