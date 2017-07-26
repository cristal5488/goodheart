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

ActiveRecord::Schema.define(version: 20170725213533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analytics", force: :cascade do |t|
    t.bigint "health_provider_id"
    t.bigint "event_id"
    t.time "arrival_time"
    t.string "bloodtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_analytics_on_event_id"
    t.index ["health_provider_id"], name: "index_analytics_on_health_provider_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "zipcode"
    t.string "phone"
    t.string "bloodtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "donor"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "health_provider_id"
    t.string "event_name"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "description"
    t.string "address"
    t.string "zipcode"
    t.string "bloodtype"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_provider_id"], name: "index_events_on_health_provider_id"
  end

  create_table "health_providers", force: :cascade do |t|
    t.string "facility_name"
    t.string "address"
    t.string "email"
    t.string "password_digest"
    t.string "webpage"
    t.text "about_us"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "health_provider"
  end

  add_foreign_key "analytics", "events"
  add_foreign_key "analytics", "health_providers"
  add_foreign_key "events", "health_providers"
end
