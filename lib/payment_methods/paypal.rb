class PaymentMethods::Paypal
  include PayPal::SDK::REST

  attr_accessor :cart, :return_url, :cancel_url, :items, :total, :payment

  def initialize(total, items, options={})
    self.total = total
    self.items = items

    options.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def process_payment
    ##create new payment (it comes from paypal gem) and returns it
    self.payment = Payment.new(payment_options)
    return self.payment
  end

  def payment_options
    {
      intent: "sale",
      payer: {
        payment_method: "paypal"
      },
      transactions: [
        {
          item_list: {
            items: self.items
          },
          amount: {
            total: "#{self.total}",
            currency: "USD"
          },
          description: "Compra de tus productos"
        }
      ],
      redirect_urls: {
        return_url: @return_url,
        cancel_url: @cancel_url
      }
    }
  end

  def self.checkout(payer_id, payment_id, &block)
    payment = Payment.find(payment_id)
    ##execute payment
    if payment.execute(payer_id: payer_id)
      yield if block_given?
    end
  end
end
