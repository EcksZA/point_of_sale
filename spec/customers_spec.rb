require 'spec_helper'

describe Customer do
  it "will create a receipt which lists a product, the amount of the product and price of each product" do
    customer1 = Customer.create({:name => "Jane Doe"})
    product1 = Product.create({:name => "Chocolate Bar", :price => 0.75, :amount => 4})
    product2 = Product.create({:name => "Bread", :price => 1.00, :amount => 2})
    product3 = Product.create({:name => "Newspaper", :price => 1.50})
    purchase1 = Purchase.create({:product_id => product1.id, :customer_id => customer1.id})
    purchase2 = Purchase.create({:product_id => product2.id, :customer_id => customer1.id})
    customer1.purchases << purchase1
    customer1.purchases << purchase2
    expect(customer1.products[0].name).to eq "Chocolate Bar"
    expect(customer1.products[0].amount).to eq 4
    expect(customer1.products[0].price).to eq 0.75
  end

  it "will total up the cost of the customers purchases" do
    customer1 = Customer.create({:name => "Jane Doe"})
    product1 = Product.create({:name => "Chocolate Bar", :price => 0.75, :amount => 4})
    product2 = Product.create({:name => "Bread", :price => 1.00, :amount => 2})
    product3 = Product.create({:name => "Newspaper", :price => 1.50})
    purchase1 = Purchase.create({:product_id => product1.id, :customer_id => customer1.id})
    purchase2 = Purchase.create({:product_id => product2.id, :customer_id => customer1.id})
    expect(customer1.total).to eq 5
  end
end
