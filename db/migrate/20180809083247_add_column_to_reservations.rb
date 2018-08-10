class AddColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :category, :string
  end
end
