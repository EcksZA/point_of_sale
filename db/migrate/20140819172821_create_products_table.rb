class CreateProductsTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :price, :money

      t.timestamps

    end
  end
end
