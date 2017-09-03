class Heat < ApplicationRecord
  belongs_to :user

  validates :user_id, :pushup_type, :length, :count, :entry_date, presence: true
  validates :entry_date, uniqueness: { scope: :user_id,
    message: "Only one heat may be entered per day." }
  validate :entry_date_cannot_be_in_the_future

  def entry_date_cannot_be_in_the_future
    if entry_date > Date.today
      errors.add(:entry_date, "cannot be in the future")
    end
  end

  def calculate_average_pushups
    heats = self.user.heats.where(["entry_date <= ?", self.entry_date]).order(entry_date: :desc)
    recent_heats = heats.where(["entry_date > ?", self.entry_date - 14])
    if heats.count < 3
      pushups_averager(heats)
    elsif recent_heats.count == 1
      pushups_averager(heats.limit(2))
    else
      pushups_averager(recent_heats.limit(6))
    end
  end

  private

  def pushups_averager(heats_array)
    # may experiment here later with ActiveRecord .average() method, this separate method may be obsolete.
    pushups_sum = heats_array.reduce(0.0) { |sum, heat| sum + heat.count }
    pushups_sum /= heats_array.count
    pushups_sum.round(1)
  end
end