class PowerLevel < ApplicationRecord

  validates :user_id, :level, presence: true

end