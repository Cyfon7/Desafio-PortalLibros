class AddColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :paid, :boolean, default: false
  end
end
