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

ActiveRecord::Schema.define(version: 20150811142226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_variants", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "text"
    t.boolean  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answer_variants", ["question_id"], name: "index_answer_variants_on_question_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "round_question_id"
    t.integer  "answer_variant_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "answers", ["answer_variant_id"], name: "index_answers_on_answer_variant_id", using: :btree
  add_index "answers", ["round_question_id"], name: "index_answers_on_round_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games_users", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  add_index "games_users", ["game_id"], name: "index_games_users_on_game_id", using: :btree
  add_index "games_users", ["user_id", "game_id"], name: "index_games_users_on_user_id_and_game_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "category_id"
    t.text     "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id", using: :btree

  create_table "round_questions", force: :cascade do |t|
    t.integer  "round_category_id"
    t.integer  "question_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "round_id"
  end

  add_index "round_questions", ["question_id"], name: "index_round_questions_on_question_id", using: :btree
  add_index "round_questions", ["round_category_id"], name: "index_round_questions_on_round_category_id", using: :btree
  add_index "round_questions", ["round_id"], name: "index_round_questions_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "rounds", ["category_id"], name: "index_rounds_on_category_id", using: :btree
  add_index "rounds", ["game_id"], name: "index_rounds_on_game_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answer_variants", "questions"
  add_foreign_key "questions", "categories"
  add_foreign_key "round_questions", "questions"
  add_foreign_key "round_questions", "rounds"
  add_foreign_key "rounds", "categories"
  add_foreign_key "rounds", "games"
end
