class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
