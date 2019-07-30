class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_proucts

  def total
    cart_proucts.sum(&:cost)
  end
end
