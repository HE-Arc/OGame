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

ActiveRecord::Schema.define(version: 20170306123456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings_planets", id: false, force: :cascade do |t|
    t.integer "planet_id",   null: false
    t.integer "building_id", null: false
  end

  create_table "defenses", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "defenses_planets", id: false, force: :cascade do |t|
    t.integer "planet_id",  null: false
    t.integer "defense_id", null: false
  end

  create_table "planets", force: :cascade do |t|
    t.string   "name"
    t.integer  "position_x"
    t.integer  "position_y"
    t.integer  "position_z"
    t.integer  "nb_cases"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "solarsystem_id"
    t.index ["solarsystem_id"], name: "index_planets_on_solarsystem_id", using: :btree
  end

  create_table "planets_spaceships", id: false, force: :cascade do |t|
    t.integer "planet_id",    null: false
    t.integer "spaceship_id", null: false
  end

  create_table "planets_users", id: false, force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "planet_id", null: false
  end

  create_table "solarsystems", force: :cascade do |t|
    t.string   "name"
    t.integer  "position_x"
    t.integer  "position_y"
    t.integer  "position_z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaceships", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.text     "description"
    t.integer  "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "metal"
    t.integer  "energy"
    t.integer  "money"
    t.integer  "planet_id"
    t.index ["planet_id"], name: "index_users_on_planet_id", using: :btree
  end

  add_foreign_key "planets", "solarsystems"
  add_foreign_key "users", "planets"
end
