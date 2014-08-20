class AddAmountColumnToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :amount, :int
  end
end
