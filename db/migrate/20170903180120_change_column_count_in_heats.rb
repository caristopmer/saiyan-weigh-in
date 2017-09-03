class ChangeColumnCountInHeats < ActiveRecord::Migration[5.1]
  def change
    change_column :heats, :count, :float
  end
end
