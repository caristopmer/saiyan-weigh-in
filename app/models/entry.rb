class Entry < ApplicationRecord

  validates :user_id, :weight, :weight_unit, presence: true

end