# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170903180120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "weight", null: false
    t.string "weight_unit", null: false
    t.float "body_fat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "entry_date", null: false
    t.float "average_weight"
  end

  create_table "heats", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "pushup_type", null: false
    t.integer "length", null: false
    t.float "count", null: false
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "entry_date", null: false
    t.float "average_count"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "power_levels", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "entry_date", null: false
    t.integer "average_level"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.integer "captain_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.integer "height", null: false
    t.string "height_unit", null: false
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender", null: false
  end

end
