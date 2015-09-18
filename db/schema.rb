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

ActiveRecord::Schema.define(version: 20150916221024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bait_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baits", force: :cascade do |t|
    t.integer  "producer_id"
    t.string   "taste"
    t.string   "color"
    t.integer  "size"
    t.integer  "bait_type_id"
    t.string   "shape"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "expedition_fishes", force: :cascade do |t|
    t.integer  "fish_id"
    t.integer  "expedition_id"
    t.integer  "length"
    t.integer  "weight"
    t.integer  "bait_id"
    t.text     "notes"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "expeditions", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "place_id"
    t.text     "notes"
    t.string   "pressure"
    t.string   "showers"
    t.string   "overcast"
    t.integer  "temperature"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fish", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "groundbaits", force: :cascade do |t|
    t.string   "color"
    t.string   "groundbait_type"
    t.string   "taste"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "place_type"
    t.string   "name"
    t.text     "notes"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "producers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
