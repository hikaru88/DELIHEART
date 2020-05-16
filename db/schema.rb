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

ActiveRecord::Schema.define(version: 2020_04_20_172532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id"
    t.string "receiver", null: false
    t.string "postal_code", null: false
    t.integer "prefecture", null: false
    t.string "city", null: false
    t.string "after", null: false
    t.boolean "is_default", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cancel_requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.text "reason", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.integer "user_id"
    t.string "title", null: false
    t.text "text", null: false
    t.boolean "already_read", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "surprise_id"
    t.integer "payment_method", null: false
    t.integer "status", default: 0, null: false
    t.string "postal_code", null: false
    t.string "receiver", null: false
    t.string "address", null: false
    t.string "surprise_name", null: false
    t.string "surprise_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "from_user_id"
    t.integer "to_user_id"
    t.string "title", null: false
    t.text "text", null: false
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_user_id"], name: "index_reviews_on_from_user_id"
    t.index ["to_user_id"], name: "index_reviews_on_to_user_id"
  end

  create_table "surprise_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "surprise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surprise_images", force: :cascade do |t|
    t.integer "surprise_id"
    t.string "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surprise_messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "surprise_id"
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surprises", force: :cascade do |t|
    t.integer "user_id"
    t.string "name", null: false
    t.text "description"
    t.integer "price", null: false
    t.boolean "is_active", default: true, null: false
    t.string "main_image_id"
    t.integer "postage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_surprises_on_name"
  end

  create_table "target_areas", force: :cascade do |t|
    t.integer "surprise_id"
    t.integer "name", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "phone_number", null: false
    t.text "introduction"
    t.string "profile_image_id"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cancel_requests", "orders"
  add_foreign_key "cancel_requests", "users"
  add_foreign_key "notices", "users"
  add_foreign_key "order_messages", "orders"
  add_foreign_key "order_messages", "users"
  add_foreign_key "orders", "surprises"
  add_foreign_key "orders", "users"
  add_foreign_key "surprise_favorites", "surprises"
  add_foreign_key "surprise_favorites", "users"
  add_foreign_key "surprise_images", "surprises"
  add_foreign_key "surprise_messages", "surprises"
  add_foreign_key "surprise_messages", "users"
  add_foreign_key "surprises", "users"
  add_foreign_key "target_areas", "surprises"
end
