class AddEntryDateToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :entry_date, :date, null: false
  end
end
