class HealthInsurance < ApplicationRecord
  belongs_to :user

  validates_presence_of :company, :plan, :card_number
end
