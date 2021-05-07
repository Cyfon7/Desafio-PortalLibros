class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :sku
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
  end
end
