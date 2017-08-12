class Heat < ApplicationRecord

  validates :user_id, :pushup_type, :length, :count, presence: true

end