class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  has_one :user, through: :product
end
