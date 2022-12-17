class Treatment < ApplicationRecord
  belongs_to :patient
  after_create :total_balance

  def total_deposite
    self.patient.treatments.sum(:deposite)
  end

  def total_balance
    balance = patient.cost - total_deposite
    patient.update(balance: balance)
  end
end
