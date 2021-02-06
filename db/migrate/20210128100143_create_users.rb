class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.string :id, primary_key: true
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
