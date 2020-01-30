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

ActiveRecord::Schema.define(version: 2019_12_04_002431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "itinerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_bookmarks_on_itinerary_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.text "description"
    t.string "image"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "country"
    t.string "experience"
    t.integer "budget"
    t.integer "days"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "bookmark", default: false
    t.string "title"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "itinerary_cities", force: :cascade do |t|
    t.bigint "itinerary_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_itinerary_cities_on_city_id"
    t.index ["itinerary_id"], name: "index_itinerary_cities_on_itinerary_id"
  end

  create_table "itinerary_spots", force: :cascade do |t|
    t.integer "days"
    t.bigint "spot_id"
    t.bigint "itinerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_itinerary_spots_on_itinerary_id"
    t.index ["spot_id"], name: "index_itinerary_spots_on_spot_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "itinerary_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_reviews_on_itinerary_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "country"
    t.string "experience"
    t.integer "budget"
    t.integer "days"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.string "zip_code"
    t.text "description"
    t.integer "price"
    t.bigint "city_id"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.string "image"
    t.index ["category_id"], name: "index_spots_on_category_id"
    t.index ["city_id"], name: "index_spots_on_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "rating"
    t.text "presentation"
    t.integer "follower"
    t.integer "following"
    t.string "country"
    t.string "countryoforigin"
    t.string "itineraryofuser"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "itineraries"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "itineraries", "users"
  add_foreign_key "itinerary_cities", "cities"
  add_foreign_key "itinerary_cities", "itineraries"
  add_foreign_key "itinerary_spots", "itineraries"
  add_foreign_key "itinerary_spots", "spots"
  add_foreign_key "reviews", "itineraries"
  add_foreign_key "reviews", "users"
  add_foreign_key "searches", "users"
  add_foreign_key "spots", "categories"
  add_foreign_key "spots", "cities"
end
