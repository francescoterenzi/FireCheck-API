class CreateControls < ActiveRecord::Migration[6.0]
  def change
    create_table :controls do |t|
        t.string :user_id
        t.references :extinguisher
        t.timestamps
    end
    add_index :controls, :user_id
  end
end