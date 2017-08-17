class Entry < ApplicationRecord
  belongs_to :user

  validates :user_id, :weight, :weight_unit, :entry_date, presence: true
  validates :entry_date, uniqueness: { scope: :user_id,
    message: "Only one weight may be entered per day." }
  validates :entry_
end