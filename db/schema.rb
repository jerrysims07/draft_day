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

ActiveRecord::Schema.define(version: 20140311212007) do

  create_table "history_stats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "passTDs"
    t.integer  "passYds"
    t.integer  "intThrown"
    t.integer  "rushTDs"
    t.integer  "rushYds"
    t.integer  "recTDs"
    t.integer  "recYds"
    t.integer  "twoPt"
    t.integer  "retTDs"
    t.integer  "fumbLost"
    t.integer  "FG50up"
    t.integer  "FG40to49"
    t.integer  "FG39down"
    t.integer  "PAT"
    t.integer  "FGmissed"
    t.integer  "defTD"
    t.integer  "defINT"
    t.integer  "defFumbRec"
    t.integer  "defBlock"
    t.integer  "defSafety"
    t.integer  "defSack"
    t.integer  "ptsAllowed0"
    t.integer  "ptsAllowed1to6"
    t.integer  "ptsAllowed7to13"
    t.string   "ptsAllowed14to17"
    t.string   "ptsAllowed18to27"
    t.string   "ptsAllowed28to34"
    t.string   "ptsAllowed35to45"
    t.integer  "ptsAllowed46plus"
    t.integer  "year"
    t.float    "avgPtsAllowed"
    t.string   "position"
    t.integer  "fantasyPts"
  end

  create_table "leagues", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "passTDs"
    t.integer  "passYds"
    t.integer  "intThrown"
    t.integer  "rushTDs"
    t.integer  "rushYds"
    t.integer  "recTDs"
    t.integer  "recYds"
    t.integer  "twoPt"
    t.integer  "retTDs"
    t.integer  "fumbLost"
    t.integer  "FG50up"
    t.integer  "FG40to49"
    t.integer  "FG39down"
    t.integer  "PAT"
    t.integer  "FGmissed"
    t.integer  "defTD"
    t.integer  "defINT"
    t.integer  "defFumbRec"
    t.integer  "defBlock"
    t.integer  "defSafety"
    t.integer  "defSack"
    t.integer  "ptsAllowed0"
    t.integer  "ptsAllowed1to6"
    t.integer  "ptsAllowed7to13"
    t.string   "ptsAllowed14to17"
    t.string   "ptsAllowed18to27"
    t.string   "ptsAllowed28to34"
    t.string   "ptsAllowed35to45"
    t.integer  "ptsAllowed46plus"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.string   "team"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projected_players", force: true do |t|
    t.string   "slot"
    t.float    "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "name"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
