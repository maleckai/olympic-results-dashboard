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

ActiveRecord::Schema.define(version: 20160511055401) do

  create_table "countries", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_teams", force: :cascade do |t|
    t.integer  "score",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "country_id"
    t.integer  "event_id"
    t.index ["country_id"], name: "index_event_teams_on_country_id"
    t.index ["event_id"], name: "index_event_teams_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_at",   null: false
    t.datetime "finish_at",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sport_id"
    t.index ["sport_id"], name: "index_events_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
