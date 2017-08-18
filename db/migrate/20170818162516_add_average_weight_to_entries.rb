class AddAverageWeightToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :average_weight, :float
  end
end
