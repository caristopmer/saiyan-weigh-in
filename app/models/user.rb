class User < ApplicationRecord
  has_many :entries
  has_many :heats
  has_many :power_levels
  has_many :memberships
  has_many :teams, through: :memberships
  
  has_secure_password

  validates :username, :email, :height, :height_unit, :gender, presence: true
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

  def chart_lines(stat, months)
    hash = {}
    if months != 0
      if stat == "weight"
        hash["Weight"] = self.entries.where(["entry_date >= ?", Date.today - (months * 30)]).pluck(:entry_date, :weight)
        hash["Average Weight"] = self.entries.where(["entry_date >= ?", Date.today - (months * 30)]).pluck(:entry_date, :average_weight)
      elsif stat == "push_ups"
        hash["Push-Ups"] = self.heats.where(["entry_date >= ?", Date.today - (months * 30)]).pluck(:entry_date, :count)
        hash["Average Push-Ups"] = self.heats.where(["entry_date >= ?", Date.today - (months * 30)]).pluck(:entry_date, :average_count)
      elsif stat == "power_levels"
        hash["Power Level"] = self.power_levels.where(["entry_date >= ?", Date.today - (months * 30)]).pluck(:entry_date, :level)
        hash["Average Power Level"] = self.power_levels.where(["entry_date >= ?", Date.today - (months * 30)]).pluck(:entry_date, :average_level)
      end
    else
      if stat == "weight"
        hash["Weight"] = self.entries.pluck(:entry_date, :weight)
        hash["Average Weight"] = self.entries.pluck(:entry_date, :average_weight)
      elsif stat == "push_ups"
        hash["Push-Ups"] = self.heats.pluck(:entry_date, :count)
        hash["Average Push-Ups"] = self.heats.pluck(:entry_date, :average_count)
      elsif stat == "power_levels"
        hash["Power Level"] = self.power_levels.pluck(:entry_date, :level)
        hash["Average Power Level"] = self.power_levels.pluck(:entry_date, :average_level)
      end
    end
    hash
  end

  private

  def total_weeks
    entries = self.entries.order(entry_date: :desc)
    (entries.first.entry_date - entries.last.entry_date) / 7
  end
end