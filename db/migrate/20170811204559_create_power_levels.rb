class CreatePowerLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :power_levels do |t|
      t.integer  :user_id, null: false
      t.integer  :level, null: false

      t.timestamps
    end
  end
end
