class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :products_name
      t.string :nickname
      t.integer :price
      t.text :concept
      t.timestamps
    end
  end
end
