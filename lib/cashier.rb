class Cashier < ActiveRecord::Base
  has_many :customers
  has_many :purchases, through: :customers
  has_many :products, through: :customers

  # def cost
  #   sum = 0
  #   total_product << Purchase.where("customer_id = self.id")
  #   total_product.each do |buy|
  #     sum +=
  # end

end
