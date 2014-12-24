# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140727175330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "seasons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                 default: false
  end

  create_table "series", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "license",    limit: 255
    t.string   "race_type",  limit: 255
    t.string   "cars",                   default: [], array: true
  end

  create_table "series_tracks", force: :cascade do |t|
    t.integer  "series_id"
    t.integer  "track_id"
    t.string   "name",       limit: 255
    t.date     "date"
    t.integer  "week"
    t.string   "duration",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "night",                  default: false
  end

  create_table "srs_track_values", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "series_track_id"
    t.string   "value",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_seasons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "season_id"
    t.string   "series_names", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "track_ids"
    t.integer  "team_id"
  end

end
