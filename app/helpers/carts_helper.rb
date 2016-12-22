module CartsHelper
  def full_cart?
    !@shopping_cart.items.empty?
  end
end
