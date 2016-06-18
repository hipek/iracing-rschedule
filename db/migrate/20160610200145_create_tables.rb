class CreateTables < ActiveRecord::Migration[5.0]
  def up
    create_table "seasons", force: :cascade do |t|
      t.string   "name",       limit: 255
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
      t.string   "name",       limit: 255
      t.date     "date"
      t.integer  "week"
      t.string   "duration",   limit: 255
      t.string   "time_of_day"
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
      t.string   "key",        limit: 50
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
    end
  end

  def down
    drop_table "seasons"
    drop_table "series"
    drop_table "series_tracks"
    drop_table "teams"
    drop_table "tracks"
    drop_table "team_member_seasons"
    drop_table "team_members"
  end
end
