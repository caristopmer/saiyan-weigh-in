class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.integer  :user_id, null: false
      t.float    :weight, null: false
      t.string   :weight_unit, null: false
      t.float    :body_fat

      t.timestamps
    end
  end
end
