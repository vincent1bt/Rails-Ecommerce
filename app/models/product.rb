class Product < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :price, :user
  validates :price, numericality: { greater_than: 0 }

  def to_paypal
    { name: title, sku: :item, price: "#{price}", currency: "USD", quantity: 1 }
  end
end
