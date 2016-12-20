class CreateMyPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :my_payments do |t|
      t.references :user, foreign_key: true, index: true
      t.references :cart, foreign_key: true, index: true
      t.string :ip
      t.string :paypal_id
      t.string :status

      t.timestamps
    end
  end
end
