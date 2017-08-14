class Entry < ApplicationRecord
  belongs_to :user

  validates :user_id, :weight, :weight_unit, presence: true
end