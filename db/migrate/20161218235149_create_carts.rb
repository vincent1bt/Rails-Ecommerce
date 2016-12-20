class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :status
      t.string :ip

      t.timestamps
    end
  end
end
