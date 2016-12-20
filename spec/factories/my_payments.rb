FactoryGirl.define do
  factory :my_payment do
    user nil
    cart nil
    ip "MyString"
    paypal_id "MyString"
    status "MyString"
  end
end
