class PowerLevel < ApplicationRecord
  belongs_to :user

  validates :user_id, :level, presence: true

  def calculate_average_level
    levels = self.user.power_levels.where(["entry_date <= ?", self.entry_date]).order(entry_date: :desc)
    recent_levels = levels.where(["entry_date > ?", self.entry_date - 14])
    if levels.count < 3
      levels_averager(levels)
    elsif !recent_levels || recent_levels.count < 4
      levels_averager(levels.limit(3))
    else
      levels_averager(recent_levels.limit(6))
    end
  end

  private

  def levels_averager(levels_array)
    # may experiment here later with ActiveRecord .average() method, this separate method may be obsolete.
    levels_sum = levels_array.reduce(0.0) { |sum, level| sum + level.count }
    levels_sum /= levels_array.count
    levels_sum.round
  end
end