class Checkout < ApplicationRecord
  belongs_to :user
  has_many :checkout_products

  before_validation :has_items
  def total
    
  end
  # Validate

  def has_items
    unless user.cart.cart_proucts.present?
      errors.add(:base, 'your cart empty now add to cart to checkout ')
    end
  end
end
