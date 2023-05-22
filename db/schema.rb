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

ActiveRecord::Schema[7.0].define(version: 2023_05_22_110845) do
  create_table "authors", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "commentars", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "commentar_text"
    t.datetime "commentar_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
    t.index ["user_id"], name: "index_commentars_on_user_id"
  end

  create_table "keyword_and_posts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "keyword_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword_id"], name: "index_keyword_and_posts_on_keyword_id"
    t.index ["post_id"], name: "index_keyword_and_posts_on_post_id"
  end

  create_table "keywords", charset: "utf8mb4", force: :cascade do |t|
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_and_authors", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_post_and_authors_on_author_id"
    t.index ["post_id"], name: "index_post_and_authors_on_post_id"
  end

  create_table "post_and_commentars", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "commentar_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id_id", null: false
    t.index ["commentar_id"], name: "index_post_and_commentars_on_commentar_id"
    t.index ["post_id"], name: "index_post_and_commentars_on_post_id"
    t.index ["user_id_id"], name: "index_post_and_commentars_on_user_id_id"
  end

  create_table "post_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "post_type_id", null: false
    t.string "title"
    t.string "post_text", limit: 2550
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
    t.index ["post_type_id"], name: "index_posts_on_post_type_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authors", "users"
  add_foreign_key "commentars", "users"
  add_foreign_key "keyword_and_posts", "keywords"
  add_foreign_key "keyword_and_posts", "posts"
  add_foreign_key "post_and_authors", "authors"
  add_foreign_key "post_and_authors", "posts"
  add_foreign_key "post_and_commentars", "commentars"
  add_foreign_key "post_and_commentars", "posts"
  add_foreign_key "posts", "post_types"
end
