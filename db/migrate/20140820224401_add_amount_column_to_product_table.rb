class AddAmountColumnToProductTable < ActiveRecord::Migration
  def change
    add_column :products, :amount, :int
  end
end
