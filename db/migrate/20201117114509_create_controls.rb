class CreateControls < ActiveRecord::Migration[6.0]
  def change
    create_table :controls do |t|
      t.belongs_to :extinguisher
      t.timestamps
    end
  end
end
