class MyPayment < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :cart

  aasm column: "status" do
    state :created, initial: true
    state :payed
    state :failed

    event :pay do
      after do
        cart.pay!
      end
      transitions from: :created, to: :payed
    end
  end
end
