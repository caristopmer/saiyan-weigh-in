class User < ApplicationRecord
  has_many :entries
  has_many :heats
  has_many :power_levels
  has_many :memberships
  has_many :teams, through: :memberships
  
  has_secure_password

  validates :username, :email, :height, :height_unit, presence: true
  validates :username, :email, uniqueness: true
end