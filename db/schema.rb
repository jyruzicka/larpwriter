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

ActiveRecord::Schema.define(version: 20131110043432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "larps", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "npc_players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "larp_id"
    t.string   "email"
    t.text     "notes"
    t.string   "phone_numbers"
    t.string   "postal_address"
    t.date     "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "npc_players", ["larp_id"], name: "index_npc_players_on_larp_id", using: :btree

  create_table "npcs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "larp_id"
    t.integer  "npc_player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "npcs", ["larp_id"], name: "index_npcs_on_larp_id", using: :btree
  add_index "npcs", ["npc_player_id"], name: "index_npcs_on_npc_player_id", using: :btree

  create_table "organizers", force: true do |t|
    t.integer  "larp_id"
    t.integer  "user_id"
    t.string   "first_name",    null: false
    t.string   "last_name"
    t.string   "email",         null: false
    t.string   "phone_numbers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizers", ["larp_id"], name: "index_organizers_on_larp_id", using: :btree
  add_index "organizers", ["user_id"], name: "index_organizers_on_user_id", using: :btree

  create_table "pcs", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "larp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
  end

  add_index "pcs", ["larp_id"], name: "index_pcs_on_larp_id", using: :btree
  add_index "pcs", ["player_id"], name: "index_pcs_on_player_id", using: :btree

  create_table "player_pcs", force: true do |t|
    t.integer  "player_id"
    t.integer  "pc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_pcs", ["pc_id"], name: "index_player_pcs_on_pc_id", using: :btree
  add_index "player_pcs", ["player_id"], name: "index_player_pcs_on_player_id", using: :btree

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "larp_id"
    t.string   "email"
    t.text     "notes"
    t.string   "phone_numbers"
    t.string   "postal_address"
    t.date     "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "players", ["larp_id"], name: "index_players_on_larp_id", using: :btree

  create_table "redactor_assets", force: true do |t|
    t.integer  "user_id"
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "site_admin",             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
