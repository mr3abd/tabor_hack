class CheckoutProduct < ApplicationRecord
  belongs_to :product
  belongs_to :checkout
end
