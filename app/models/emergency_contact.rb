class EmergencyContact < ApplicationRecord
  belongs_to :user

  validates_presence_of :full_name, :kinship_degree, :phone
end
