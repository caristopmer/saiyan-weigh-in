class PowerLevel < ApplicationRecord
  belongs_to :user

  validates :user_id, :level, :entry_date, presence: true
end