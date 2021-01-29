class CreateExtinguishers < ActiveRecord::Migration[6.0]
  def change
    create_table :extinguishers do |t|
      t.string :matricola
      t.references :company
      t.timestamps
    end
  end
end
