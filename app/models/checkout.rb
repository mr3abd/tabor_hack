class Checkout < ApplicationRecord
  belongs_to :user
  has_many :checkout_products

  before_validation :has_items

  def has_items
    unless user.cart.cart_proucts.present?
      
    end
  end
end
