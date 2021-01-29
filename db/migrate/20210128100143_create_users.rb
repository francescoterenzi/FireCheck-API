class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.string :id, primary_key: true
      t.timestamps
    end
  end
end
