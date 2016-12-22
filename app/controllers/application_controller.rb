class ApplicationController < ActionController::Base
  before_action :set_cart

  protect_from_forgery with: :exception
  include SessionsHelper
  include CartsHelper

  private

  #find or create cart_id cookie to use in controllers
  def set_cart
    if cookies[:cart_id].blank?
      @shopping_cart = Cart.create!(ip: request.remote_ip)
      cookies[:cart_id] = @shopping_cart.id
    else
      @shopping_cart = Cart.find(cookies[:cart_id])
    end

  #if RecordNotFound create a new cart_id cookie
  rescue ActiveRecord::RecordNotFound => e
    @shopping_cart = Cart.create!(ip: request.remote_ip)
    cookies[:cart_id] = @shopping_cart.id
  end
end
