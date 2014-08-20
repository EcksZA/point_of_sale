require 'pg'
require 'rspec'
require 'active_record'

require './lib/cashier'
require './lib/product'
require './lib/purchase'
require './lib/customer'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
  config.after(:each) do
    Cashier.all.each {|cashier| cashier.destroy}
    Product.all.each {|product| product.destroy}
    Purchase.all.each {|purchase| purchase.destroy}
    Customer.all.each {|customer| customer.destroy}
  end
end
