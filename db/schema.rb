# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_20_231931) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "company_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_participants", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_participants_on_message_id"
    t.index ["user_id"], name: "index_message_participants_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "message", null: false
    t.bigint "sender_id"
    t.date "edited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
  end

  add_foreign_key "message_participants", "messages"
  add_foreign_key "message_participants", "users"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "users", "accounts"
end
