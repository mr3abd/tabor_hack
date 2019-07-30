class CreateCartProucts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_proucts do |t|
      t.references :product, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
