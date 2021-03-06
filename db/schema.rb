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

ActiveRecord::Schema.define(version: 20140723132823) do

  create_table "dragonmedals", force: true do |t|
    t.string   "type_of_medal"
    t.integer  "dragon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dragons", force: true do |t|
    t.string   "name"
    t.integer  "hit_points",    default: 100
    t.integer  "damage",        default: 10
    t.integer  "kills",         default: 0
    t.integer  "deaths",        default: 0
    t.integer  "level",         default: 1
    t.datetime "time_of_death", default: '2014-07-23 16:20:43'
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manmedals", force: true do |t|
    t.string   "type_of_medal"
    t.integer  "man_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "men", force: true do |t|
    t.string   "name"
    t.integer  "hit_points",    default: 100
    t.integer  "damage",        default: 10
    t.integer  "kills",         default: 0
    t.integer  "deaths",        default: 0
    t.integer  "level",         default: 1
    t.datetime "time_of_death", default: '2014-07-23 16:20:43'
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "men", ["user_id"], name: "index_men_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_money",             default: 10
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
