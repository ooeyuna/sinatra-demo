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

ActiveRecord::Schema.define(version: 20170902123848) do

  create_table "download_infos", force: :cascade do |t|
    t.string "file_id", null: false
    t.float "progress", default: 0.0, null: false
    t.integer "allow_retry", default: 3, null: false
    t.integer "priority", default: 2, null: false
    t.string "current_downloader"
    t.string "current_request_id", null: false
    t.integer "step", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "muslim_files", id: :string, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "download_status", null: false
    t.integer "download_type", null: false
    t.integer "file_size", limit: 8
    t.string "file_hash", null: false
    t.string "storage_id"
    t.datetime "completed_at"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "sqlite_autoindex_muslim_files_1", unique: true
  end

end
