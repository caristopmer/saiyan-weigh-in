class AddAverageLevelToPowerLevels < ActiveRecord::Migration[5.1]
  def change
    add_column :power_levels, :average_level, :integer
  end
end
