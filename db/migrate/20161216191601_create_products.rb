class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.decimal :price, precision: 10, scale: 2
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
