class CreateExtinguishers < ActiveRecord::Migration[6.0]
  def change
    create_table :extinguishers, id: false do |t|
      t.string :id, primary_key: true
      t.string :typology
      t.string :weight
      t.string :company_id
      t.timestamps
    end
    add_index :extinguishers, :company_id
  end
end
