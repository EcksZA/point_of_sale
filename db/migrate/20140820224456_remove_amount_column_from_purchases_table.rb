class RemoveAmountColumnFromPurchasesTable < ActiveRecord::Migration
  def change
    remove_column :purchases, :amount, :int
  end
end
