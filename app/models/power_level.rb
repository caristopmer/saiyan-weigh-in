class PowerLevel < ApplicationRecord
  belongs_to :user

  validates :user_id, :level, :entry_date, presence: true
  validates :entry_date, uniqueness: { scope: :user_id,
    message: "Only one power level may be calculated per day." }
  validate :entry_date_cannot_be_in_the_future

  def entry_date_cannot_be_in_the_future
    if entry_date > Date.today
      errors.add(:entry_date, "cannot be in the future")
    end
  end

  def calculate_level
    return nil if pushup_points == nil || bmi == nil
    raw_level = 5000 + pushup_points
    bmi_multiplier = 1 - (((bmi - 22.0).abs / 22.0) * 2)
    raw_level * bmi_multiplier
  end

  def calculate_average_level
    levels = self.user.power_levels.where(["entry_date <= ?", self.entry_date]).order(entry_date: :desc)
    recent_levels = levels.where(["entry_date > ?", self.entry_date - 14])
    if levels.count < 3
      levels_averager(levels)
    elsif recent_levels.count < 3
      levels_averager(levels.limit(3))
    else
      levels_averager(recent_levels.limit(6))
    end
  end

  private

  def levels_averager(levels_array)
    # may experiment here later with ActiveRecord .average() method, this separate method may be obsolete.
    levels_sum = levels_array.reduce(0.0) { |sum, level| sum + level.level }
    levels_sum /= levels_array.count
    levels_sum.round
  end

  def bmi
    relevant_entries = self.user.entries.where(["entry_date >= ? and entry_date <= ?", self.entry_date - 7, self.entry_date]).order(entry_date: :desc)
    return nil if relevant_entries.count == 0

    weight = relevant_entries.first.average_weight
    height = self.user.height

    current_bmi = (weight / (height * height)) * 703.0
    current_bmi.round(2)
  end

  def pushup_points
    relevant_heats = self.user.heats.where(["entry_date >= ? and entry_date <= ?", self.entry_date - 3, self.entry_date]).order(entry_date: :desc)
    return nil if relevant_heats.count == 0

    last_heat = relevant_heats.first
    last_heat.average_count * 180
  end
end