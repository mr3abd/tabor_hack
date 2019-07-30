class CartProuct < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  before_create :create_cost
  def create_cost
    self.cost = product.price * quantity
  end
end
