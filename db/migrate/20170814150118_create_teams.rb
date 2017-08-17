class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string   :name, null: false
      t.integer  :captain_id, null: false

      t.timestamps
    end
  end
end
