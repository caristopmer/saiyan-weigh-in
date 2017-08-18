class User < ApplicationRecord
  has_many :entries
  has_many :heats
  has_many :power_levels
  has_many :memberships
  has_many :teams, through: :memberships
  
  has_secure_password

  validates :username, :email, :height, :height_unit, presence: true
  validates :username, :email, uniqueness: true

  def weekly_change(weeks = nil)
    if weeks
      entries = self.entries.where(["entry_date > ?", Date.today - (weeks * 7)]).order(entry_date: :desc)
    else
      entries = self.entries.order(entry_date: :desc)
      weeks = (entries.first.entry_date - entries.last.entry_date) / 7
    end
    delta = (entries.first.average_weight - entries.last.weight) / weeks
    delta.round(2)
  end
end