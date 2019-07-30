class CreateCheckoutProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :checkout_products do |t|
      t.references :product, foreign_key: true
      t.references :checkout, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
