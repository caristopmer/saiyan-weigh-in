class Heat < ApplicationRecord
  belongs_to :user

  validates :user_id, :pushup_type, :length, :count, presence: true

  def calculate_average_pushups
    heats = self.user.heats.where(["entry_date <= ?", self.entry_date]).order(entry_date: :desc)
    recent_heats = heats.where(["entry_date > ?", self.entry_date - 14])
    if heats.count < 3
      pushups_averager(heats)
    elsif !recent_heats || recent_heats.count < 4
      pushups_averager(heats.limit(3))
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