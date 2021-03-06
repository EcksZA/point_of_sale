require 'spec_helper'

describe Cashier do
  it "will show which cashier is responsible for which purchase" do
    cashier1 = Cashier.create({:name => "Tom Smith"})
    cashier2 = Cashier.create({:name => "Maggie Thomas"})
    customer1 = Customer.create({:name => "Bob Newhart", :cashier_id => cashier1.id})
    customer2 = Customer.create({:name => "Shirley Temple", :cashier_id => cashier1.id})
    customer3 = Customer.create({:name => "Roger Moore", :cashier_id => cashier2.id})
    product1 = Product.create({:name => "Chocolate Bar"})
    product2 = Product.create({:name => "Bread"})
    product3 = Product.create({:name => "Newspaper"})
    product4 = Product.create({:name => "Milk"})
    purchase1 = Purchase.create({:customer_id => customer1.id, :product_id => product2.id})
    purchase2 = Purchase.create({:customer_id => customer2.id, :product_id => product1.id})
    purchase3 = Purchase.create({:customer_id => customer2.id, :product_id => product3.id})
    purchase4 = Purchase.create({:customer_id => customer3.id, :product_id => product4.id})
    expect(cashier1.purchases).to eq [purchase1, purchase2, purchase3]
    expect(cashier2.purchases).to eq [purchase4]
  end

  it "will show the cashier products a customer purchased" do
    cashier1 = Cashier.create({:name => "Tom Smith"})
    customer1 = Customer.create({:name => "Jane Doe", :cashier_id => cashier1.id})
    product1 = Product.create({:name => "Chocolate Bar"})
    product2 = Product.create({:name => "Bread"})
    product3 = Product.create({:name => "Newspaper"})
    customer1.products << product1
    customer1.products << product2
    expect(cashier1.products).to eq [product1, product2]
  end

  it "will show the amount of each product the customer has purchased" do
    cashier1 = Cashier.create({:name => "Tom Smith"})
    customer1 = Customer.create({:name => "Jane Doe", :cashier_id => cashier1.id})
    product1 = Product.create({:name => "Chocolate Bar"})
    product2 = Product.create({:name => "Bread", :amount => 2})
    product3 = Product.create({:name => "Newspaper", :amount => 3})
    purchase1 = Purchase.create({:product_id => product2.id, :customer_id => customer1.id})
    purchase2 = Purchase.create({:product_id => product3.id, :customer_id => customer1.id})
    customer1.purchases << purchase1
    customer1.purchases << purchase2
    expect(cashier1.purchases).to eq [purchase1, purchase2]
    expect(cashier1.products[0].amount).to eq 2
    expect(cashier1.products[1].amount).to eq 3
  end


end
