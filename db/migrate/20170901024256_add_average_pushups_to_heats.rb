class AddAveragePushupsToHeats < ActiveRecord::Migration[5.1]
  def change
    add_column :heats, :average_count, :float
  end
end
