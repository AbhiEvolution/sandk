class CreateTreatementtypes < ActiveRecord::Migration[7.0]
  def change
    create_table :treatementtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
