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

ActiveRecord::Schema[8.0].define(version: 2025_02_19_134519) do
  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "publisher"
    t.integer "year_published", default: 2000, null: false
    t.string "shelf"
    t.integer "quanty", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_categories_on_book_id"
    t.index ["genre_id"], name: "index_categories_on_genre_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_publications_on_author_id"
    t.index ["book_id"], name: "index_publications_on_book_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.date "rental_date"
    t.date "return_date"
    t.date "return_estimate_date"
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_rentals_on_book_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
    t.check_constraint "rental_date <= return_estimate_date", name: "rental_date_must_be_before_return_estimate_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "habilitaded", default: true
    t.string "registration"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "books"
  add_foreign_key "categories", "genres"
  add_foreign_key "publications", "authors"
  add_foreign_key "publications", "books"
  add_foreign_key "rentals", "books"
  add_foreign_key "rentals", "users"
end
