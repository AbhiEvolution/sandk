class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :age
      t.text :address
      t.string :phone
      t.integer :cost
      t.integer :user_id
      t.timestamps
    end
  end
end
