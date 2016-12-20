class CartItemsController < ApplicationController
  def create
    cart_item = CartItem.new(product_id: params[:product_id], cart: @shopping_cart)
    if cart_item.save
      redirect_to cart_path, notice: "Product saved"
    else
      redirect_to products_path(id: params[:product_id]), notice: "Try later"
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy

    redirect_to cart_path
  end
end
