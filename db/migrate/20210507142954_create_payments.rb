class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :reservation, foreign_key: true
      t.integer :state
      t.decimal :total

      t.timestamps
    end
  end
end
