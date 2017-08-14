class Team < ApplicationRecord
  belongs_to :captain, class_name: "User"
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  
  validates :name, :captain_id, presence: true
end