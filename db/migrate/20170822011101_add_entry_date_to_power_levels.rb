class AddEntryDateToPowerLevels < ActiveRecord::Migration[5.1]
  def change
    add_column :power_levels, :entry_date, :date, null: false
  end
end
