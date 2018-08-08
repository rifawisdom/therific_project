class CreateTherapists < ActiveRecord::Migration[5.2]
  def change
    create_table :therapists do |t|
    	t.string :address
    	t.integer :coins
    	t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
