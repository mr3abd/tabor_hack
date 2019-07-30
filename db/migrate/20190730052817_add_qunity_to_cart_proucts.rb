class AddQunityToCartProucts < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_proucts, :quantity, :integer
  end
end
