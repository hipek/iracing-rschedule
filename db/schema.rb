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

ActiveRecord::Schema.define(version: 20160619110933) do

  create_table "seasons", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.date     "active_from"
    t.date     "active_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "season_id"
    t.string   "license",    limit: 255
    t.string   "race_type",  limit: 255
    t.string   "cars",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series_tracks", force: :cascade do |t|
    t.integer  "series_id"
    t.integer  "track_id"
    t.string   "name",        limit: 255
    t.date     "date"
    t.integer  "week"
    t.string   "duration",    limit: 255
    t.string   "time_of_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_member_seasons", force: :cascade do |t|
    t.integer  "team_member_id"
    t.integer  "season_id"
    t.text     "series_names"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_members", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "track_ids"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "key",        limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
