class Patient < ApplicationRecord
  belongs_to :user
  has_many :treatments, dependent: :destroy
  def total_deposite
    self.treatments.sum(:deposite)
  end

  def total_balance(patient)
   patient.cost - self.total_deposite
  end

  def all_treartments(patient)
    self.treatments.all.pluck(:typeoftreatement).uniq.to_sentence
  end
end
