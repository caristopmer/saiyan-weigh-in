class User < ApplicationRecord
  has_many :entries
  has_many :heats
  has_many :power_levels
  has_many :memberships
  has_many :teams, through: :memberships
  
  has_secure_password

  validates :username, :email, :height, :height_unit, presence: true
  validates :username, :email, uniqueness: true

  def change_over_period(weeks = nil)
    if weeks
      entries = self.entries.where(["entry_date > ?", Date.today - (weeks * 7)]).order(entry_date: :desc)
    else
      entries = self.entries.order(entry_date: :desc)
    end
    return (entries.first.average_weight - entries.last.weight).round(2) if entries.count > 0
    0.00
  end

  def weekly_change(weeks = nil)
    if weeks
      if weeks > total_weeks
        delta = change_over_period(weeks) / total_weeks
      else
        delta = change_over_period(weeks) / weeks
      end
    else
      delta = change_over_period / total_weeks
    end
    delta.round(2)
  end

  def entries_hash
    hash = {}
    self.entries.map do |entry|
      hash[entry.entry_date.to_s] = entry.weight
    end
  end

  private

  def total_weeks
    entries = self.entries.order(entry_date: :desc)
    (entries.first.entry_date - entries.last.entry_date) / 7
  end
end