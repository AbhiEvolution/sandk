class Patient < ApplicationRecord
  belongs_to :user
  has_many :treatments, dependent: :destroy
end
