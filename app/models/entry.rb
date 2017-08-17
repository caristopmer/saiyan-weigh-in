class Entry < ApplicationRecord
  belongs_to :user

  validates :user_id, :weight, :weight_unit, :entry_date, presence: true
  validates :entry_date, uniqueness: { scope: :user_id,
    message: "Only one weight may be entered per day." }
  validate :entry_date_cannot_be_in_the_future
 
  def entry_date_cannot_be_in_the_future
    if entry_date > Date.today
      errors.add(:entry_date, "cannot be in the future")
    end
  end
end