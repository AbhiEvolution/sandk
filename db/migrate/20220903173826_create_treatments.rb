class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.text :typeoftreatement
      t.text :teeth
      t.text :medicine
      t.datetime :nextappointment
      t.references :patient, null: false, foreign_key: true
      t.timestamps
    end
  end
end
