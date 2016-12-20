class Cart < ApplicationRecord
  include AASM

  has_many :products, through: :cart_item
  has_many :cart_item

  aasm column: "status" do
    state :created, initial: true
    state :payed
    state :failed

    event :pay do
      transitions from: :created, to: :payed
    end
  end

  def items
    self.products.map { |product| product.to_paypal }
  end

  def total
    products.sum(:price)
  end
end
