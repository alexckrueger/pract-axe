class CreateThrows < ActiveRecord::Migration[7.0]
  def change
    create_table :throws do |t|
      t.integer :training_id
      t.integer :points
      t.boolean :clutch_called, :default => false
      t.boolean :big_axe, :default => false

      t.timestamps
    end
  end
end
