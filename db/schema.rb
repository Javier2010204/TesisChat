# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_04_164209) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "professional_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["professional_id"], name: "index_chats_on_professional_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "email_links", force: :cascade do |t|
    t.string "token"
    t.datetime "expires_at"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_email_links_on_user_id"
  end

  create_table "extension_orders", force: :cascade do |t|
    t.date "extension_date"
    t.integer "order_id", null: false
    t.integer "user_id", null: false
    t.integer "receiver_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_extension_orders_on_order_id"
    t.index ["receiver_id"], name: "index_extension_orders_on_receiver_id"
    t.index ["user_id"], name: "index_extension_orders_on_user_id"
  end

  create_table "extensions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "chat_id", null: false
    t.integer "receiver_id", null: false
    t.string "status"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_extensions_on_chat_id"
    t.index ["receiver_id"], name: "index_extensions_on_receiver_id"
    t.index ["user_id"], name: "index_extensions_on_user_id"
  end

  create_table "homework_reviews", force: :cascade do |t|
    t.string "status"
    t.integer "editor_id", null: false
    t.integer "homework_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["editor_id"], name: "index_homework_reviews_on_editor_id"
    t.index ["homework_id"], name: "index_homework_reviews_on_homework_id"
  end

  create_table "homeworks", force: :cascade do |t|
    t.integer "chat_id", null: false
    t.integer "user_id", null: false
    t.integer "receiver_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_homeworks_on_chat_id"
    t.index ["receiver_id"], name: "index_homeworks_on_receiver_id"
    t.index ["user_id"], name: "index_homeworks_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "professional_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["professional_id"], name: "index_job_applications_on_professional_id"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "chat_id", null: false
    t.integer "user_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "receiver_id", null: false
    t.integer "chat_id", null: false
    t.date "date"
    t.text "body"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number_page"
    t.date "extension_date"
    t.index ["chat_id"], name: "index_orders_on_chat_id"
    t.index ["receiver_id"], name: "index_orders_on_receiver_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.text "body"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_progresses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "rol", default: "student"
    t.integer "points"
    t.integer "career_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "mount", default: "0.0"
    t.string "type_service"
    t.index ["career_id"], name: "index_users_on_career_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chats", "users"
  add_foreign_key "email_links", "users"
  add_foreign_key "extension_orders", "orders"
  add_foreign_key "extension_orders", "users"
  add_foreign_key "extensions", "chats"
  add_foreign_key "extensions", "users"
  add_foreign_key "homework_reviews", "homeworks"
  add_foreign_key "homeworks", "chats"
  add_foreign_key "homeworks", "users"
  add_foreign_key "job_applications", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "chats"
  add_foreign_key "orders", "users"
  add_foreign_key "progresses", "users"
  add_foreign_key "users", "users", column: "career_id"
end
