class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.string :comment
    	t.integer :star
    	t.belongs_to :reservation
    	t.belongs_to :therapist
    	t.integer :reviewed_by

      t.timestamps
    end
  end
end
