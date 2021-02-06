class CreateControls < ActiveRecord::Migration[6.0]
  def change
    create_table :controls do |t|
      t.string :date_of_control
      t.string :user_id
      t.string :extinguisher_id
      t.timestamps
    end
    add_index :controls, :user_id
    add_index :controls, :extinguisher_id
  end
end