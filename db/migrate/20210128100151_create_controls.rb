class CreateControls < ActiveRecord::Migration[6.0]
  def change
    create_table :controls do |t|
      t.references :user
      t.references :extinguisher
    end
  end
end
