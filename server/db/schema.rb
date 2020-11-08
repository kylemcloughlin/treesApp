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

ActiveRecord::Schema.define(version: 2020_11_05_182936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.integer "address"
    t.string "name"
    t.integer "geo_id"
    t.float "x"
    t.float "y"
    t.integer "struct_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trees", force: :cascade do |t|
    t.string "common_name"
    t.string "botanical_name"
    t.integer "dbh_trunk"
    t.string "geometry_type"
    t.float "lat_coordinate"
    t.float "long_coordinate"
    t.integer "tree_posit"
    t.integer "address"
    t.string "name"
    t.bigint "type_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_trees_on_location_id"
    t.index ["type_id"], name: "index_trees_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "common_name"
    t.string "botanical_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "trees", "locations"
  add_foreign_key "trees", "types"
end
