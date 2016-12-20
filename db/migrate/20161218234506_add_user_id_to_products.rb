class AddUserIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :user, foreign_key: true, index: true
  end
end
