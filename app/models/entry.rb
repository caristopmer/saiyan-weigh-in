class Entry < ApplicationRecord
  belongs_to :user

  validates :user_id, :weight, :weight_unit, :entry_date, presence: true
end