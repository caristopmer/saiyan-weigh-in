class AddEntryDateToHeats < ActiveRecord::Migration[5.1]
  def change
    add_column :heats, :entry_date, :date, null: false
  end
end
