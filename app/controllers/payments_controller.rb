class PaymentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    paypal_payment = PaymentMethods::Paypal.new(@shopping_cart.total,
                                                @shopping_cart.items,
                                                return_url: checkout_url,
                                                cancel_url: cart_url)
    if paypal_payment.process_payment.create
      @my_payment = @current_user.my_payments.create!(paypal_id: paypal_payment.payment.id, ip: request.remote_ip, cart: @shopping_cart)
      redirect_to paypal_payment.payment.links.find{ |v| v.method == "REDIRECT" }.href
    end
  end

  def checkout
    @my_payment = MyPayment.find_by(paypal_id: params[:paymentId])
    if @my_payment.nil?
      redirect_to cart_path, notice: "Error with the cart"
    else
      PaymentMethods::Paypal.checkout(params[:PayerID], params[:paymentId]) do
        @my_payment.pay!
        ##delete cart cookie to have a new cart
        cookies.delete(:cart_id)
        redirect_to cart_path, notice: "Se proceso el pago"
        return
      end
      redirect_to cart_path, notice: "Try later"
    end
  end
end
