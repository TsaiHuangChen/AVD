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

ActiveRecord::Schema.define(version: 20150601023704) do

  create_table "alerts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "name"
    t.boolean  "site_difference_detect_enable"
    t.integer  "site_difference_detect_window"
    t.boolean  "continuously_failure_detect_enable"
    t.integer  "continuously_failure_detect_threshold"
    t.boolean  "time_variance_detect_enable"
    t.integer  "time_variance_detect_window_small"
    t.integer  "time_variance_detect_window_large"
    t.float    "time_variance_detect_threshold"
    t.boolean  "different_tester_variance_detect_enable"
    t.integer  "different_tester_variance_detect_window"
    t.float    "different_tester_variance_detect_threshold"
    t.decimal  "site_difference_detect_threshold"
  end

  create_table "lots", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "name"
    t.string   "tester"
    t.integer  "device"
    t.integer  "total_device_count"
    t.integer  "site_number"
    t.float    "basic_yield"
    t.integer  "cliff_number"
    t.float    "first_region_yield"
    t.float    "second_region_yield"
    t.boolean  "site_0_enable"
    t.boolean  "site_1_enable"
    t.boolean  "site_2_enable"
    t.boolean  "site_3_enable"
    t.boolean  "site_4_enable"
    t.boolean  "site_5_enable"
    t.boolean  "site_6_enable"
    t.boolean  "site_7_enable"
    t.float    "site_0_yield"
    t.float    "site_1_yield"
    t.float    "site_2_yield"
    t.float    "site_3_yield"
    t.float    "site_4_yield"
    t.float    "site_5_yield"
    t.float    "site_6_yield"
    t.float    "site_7_yield"
    t.integer  "generate_mode"
    t.integer  "device_id"
  end

  add_index "lots", ["device_id"], name: "index_lots_on_device_id"

  create_table "sites", force: :cascade do |t|
    t.string   "site_lot"
    t.integer  "site_serial"
    t.boolean  "site_enable"
    t.float    "site_yield"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
