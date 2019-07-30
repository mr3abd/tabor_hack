class AddCostToCartProucts < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_proucts, :cost, :decimal
  end
end
