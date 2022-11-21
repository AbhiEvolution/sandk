class AddQuardrantToTreatments < ActiveRecord::Migration[7.0]
  def change
    add_column :treatments, :quadrant, :string
    add_column :treatments, :deposite, :integer
  end
end
