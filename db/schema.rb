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

ActiveRecord::Schema[7.0].define(version: 2022_05_06_221236) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", null: false
    t.date "release_date"
    t.bigint "isbn"
    t.jsonb "subjects"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "source_id", null: false
    t.bigint "result_id"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_id"], name: "index_recommendations_on_result_id"
    t.index ["source_id"], name: "index_recommendations_on_source_id"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.bigint "similar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["similar_id"], name: "index_subjects_on_similar_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "recommendations", "books", column: "result_id"
  add_foreign_key "recommendations", "books", column: "source_id"
  add_foreign_key "subjects", "subjects", column: "similar_id"
end
