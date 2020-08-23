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

ActiveRecord::Schema.define(version: 2020_08_23_102146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_urls", force: :cascade do |t|
    t.string "source_name"
    t.string "source_url"
    t.string "data_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
  end

  create_table "pandemic_data_associations", force: :cascade do |t|
    t.bigint "pandemic_id", null: false
    t.bigint "data_url_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["data_url_id"], name: "index_pandemic_data_associations_on_data_url_id"
    t.index ["pandemic_id"], name: "index_pandemic_data_associations_on_pandemic_id"
  end

  create_table "pandemics", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pandemic_data_associations", "data_urls"
  add_foreign_key "pandemic_data_associations", "pandemics"
end
