class Customer < ActiveRecord::Base
  belongs_to :cashier
  has_many :purchases
  has_many :products, through: :purchases

  def total
    total = 0
    self.products.each do |item|
      total += item.price * item.amount
    end
    total
  end
end
