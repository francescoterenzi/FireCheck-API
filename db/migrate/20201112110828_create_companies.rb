class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies, id: false do |t|
      t.string :id, primary_key: true
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end
