class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.string :typeoftreatement
      t.string :teeth
      t.text :medicine
      t.string :nextappointment
      t.references :patient, null: false, foreign_key: true
      t.timestamps
    end
  end
end
