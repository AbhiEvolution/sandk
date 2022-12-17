class AddBalanceToTreatement < ActiveRecord::Migration[7.0]
  def change
     add_column :patients, :balance, :integer
  end
end
