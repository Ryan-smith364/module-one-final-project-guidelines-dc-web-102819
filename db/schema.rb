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

ActiveRecord::Schema.define(version: 2019_11_12_204310) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "difficulty"
  end

  create_table "golfers", force: :cascade do |t|
    t.string "name"
    t.integer "handicap"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "zip"
    t.integer "course_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "course_id"
    t.integer "golfer_id"
    t.string "review"
    t.integer "rating"
  end

end
