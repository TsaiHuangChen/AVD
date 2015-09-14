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

ActiveRecord::Schema.define(version: 20150914103801) do

  create_table "alerts", force: :cascade do |t|
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "alerts_kind"
    t.boolean  "fixed",                    default: false
    t.integer  "lot_id"
    t.float    "max_yield"
    t.float    "min_yield"
    t.string   "max_element"
    t.string   "min_element"
    t.float    "region_1_yield"
    t.float    "region_2_yield"
    t.integer  "detected_serial",          default: 0
    t.integer  "continuously_fail_number", default: 0
    t.integer  "continuously_fail_bin",    default: 0
  end

  add_index "alerts", ["lot_id"], name: "index_alerts_on_lot_id"

  create_table "data", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "bin"
    t.integer  "serial",     default: 0
    t.integer  "lot_id"
    t.integer  "site"
  end

  add_index "data", ["lot_id"], name: "index_data_on_lot_id"

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
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "name"
    t.string   "tester"
    t.integer  "device"
    t.integer  "total_device_count"
    t.integer  "site_number"
    t.float    "basic_yield"
    t.integer  "cliff_number"
    t.float    "first_region_yield"
    t.float    "second_region_yield"
    t.integer  "generate_mode"
    t.integer  "device_id"
    t.boolean  "site_difference_detected",           default: false
    t.boolean  "continuously_failure_detected",      default: false
    t.boolean  "time_variance_detected",             default: false
    t.boolean  "different_tester_variance_detected", default: false
  end

  add_index "lots", ["device_id"], name: "index_lots_on_device_id"

  create_table "sites", force: :cascade do |t|
    t.integer  "site_serial"
    t.boolean  "site_enable"
    t.float    "site_yield"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "lot_id"
  end

  add_index "sites", ["lot_id"], name: "index_sites_on_lot_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
