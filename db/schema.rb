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

ActiveRecord::Schema.define(version: 20140724121610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "matches", force: true do |t|
    t.integer  "round_id"
    t.datetime "date"
    t.boolean  "finished",                  default: false
    t.integer  "receiving_contestant_id"
    t.string   "receiving_contestant_type"
    t.integer  "invited_contestant_id"
    t.string   "invited_contestant_type"
    t.hstore   "results"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_positions", force: true do |t|
    t.string   "name"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "player_position_id"
    t.date     "date_of_birth"
    t.integer  "continent_id"
    t.integer  "game_id"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["username", "game_id"], name: "index_players_on_username_and_game_id", unique: true, using: :btree

  create_table "rounds", force: true do |t|
    t.integer  "tournament_id"
    t.integer  "round_type"
    t.integer  "points_multiplier"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_direct_elimination_round", default: false
    t.boolean  "finished",                    default: false
    t.integer  "receiving_contestant_id"
    t.string   "receiving_contestant_type"
    t.integer  "invited_contestant_id"
    t.string   "invited_contestant_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_players", force: true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "continent_id"
    t.integer  "game_id"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["name", "game_id"], name: "index_teams_on_name_and_game_id", unique: true, using: :btree

  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.integer  "game_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "venue_id"
    t.integer  "continent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_match_predictions", force: true do |t|
    t.integer  "match_id"
    t.integer  "prediction_type"
    t.integer  "predicted_contestant_id"
    t.string   "predicted_contestant_type"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_match_predictions", ["match_id", "user_id", "prediction_type"], name: "index_ump_on_match_and_user_and_prediction_type", unique: true, using: :btree

  create_table "user_round_predictions", force: true do |t|
    t.integer  "round_id"
    t.integer  "prediction_type"
    t.integer  "predicted_contestant_id"
    t.string   "predicted_contestant_type"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_round_predictions", ["round_id", "user_id"], name: "index_user_round_predictions_on_round_id_and_user_id", unique: true, using: :btree

  create_table "user_tournament_scores", force: true do |t|
    t.integer  "user_id"
    t.integer  "tournament_id"
    t.integer  "score",         default: 0
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venues", ["name"], name: "index_venues_on_name", unique: true, using: :btree

end
