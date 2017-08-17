class Heat < ApplicationRecord
  belongs_to :user

  validates :user_id, :pushup_type, :length, :count, presence: true
end