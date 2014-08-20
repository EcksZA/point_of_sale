class CreatePurchasesJoinTable < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.column :product_id, :int
      t.column :customer_id, :int

      t.timestamps
    end
  end
end
