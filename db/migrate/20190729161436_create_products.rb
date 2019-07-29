class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :barcode
      t.decimal :price

      t.timestamps
    end
  end
end
