class Product < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :price, :user
  validates :price, numericality: { greater_than: 0 }

  has_attached_file :image, styles: { big: "900x900", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def to_paypal
    { name: title, sku: :item, price: "#{price}", currency: "USD", quantity: 1 }
  end
end
