class PowerLevel < ApplicationRecord
  belongs_to :user

  validates :user_id, :level, presence: true
end