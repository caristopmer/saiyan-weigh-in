class CreateHeats < ActiveRecord::Migration[5.1]
  def change
    create_table :heats do |t|
      t.integer  :user_id, null: false
      t.string   :pushup_type, null: false
      t.integer  :length, null: false
      t.integer  :count, null: false
      t.string   :video_url

      t.timestamps
    end
  end
end
