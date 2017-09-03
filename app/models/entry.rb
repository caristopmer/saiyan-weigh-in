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

  def calculate_average_weight
    entries = self.user.entries.where(["entry_date <= ?", self.entry_date]).order(entry_date: :desc)
    recent_entries = entries.where(["entry_date > ?", self.entry_date - 14])
    if entries.count < 3
      weight_averager(entries)
    elsif recent_entries.count == 1
      weight_averager(entries.limit(2))
    else
      weight_averager(recent_entries.limit(6))
    end
  end

  private

  def weight_averager(entries_array)
    # may experiment here later with ActiveRecord .average() method, this separate method may be obsolete.
    weight_sum = entries_array.reduce(0) { |sum, entry| sum + entry.weight }
    weight_sum /= entries_array.count
    weight_sum.round(1)
  end
end