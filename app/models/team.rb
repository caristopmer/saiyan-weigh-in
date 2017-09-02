class Team < ApplicationRecord
  belongs_to :captain, class_name: "User"
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  
  validates :name, :captain_id, presence: true

  def total_team_weight_change
    self.members.reduce(0) { |sum, member| sum + member.change_over_period }
  end
end