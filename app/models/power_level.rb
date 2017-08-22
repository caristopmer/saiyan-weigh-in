class PowerLevel < ApplicationRecord
  belongs_to :user

  validates :user_id, :level, :entry_date, presence: true

  # user decides to calculate their power level on a specified date
  # post request is made to power levels
  # power level is created for currently logged in user
  # level is determined from that user's data at time of entry date
  # current bmi points act as multiplier and set a baseline, each pushup adds points to power level as multiplied by bmi multiplier
  
end