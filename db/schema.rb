# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171203141209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crash_locations", force: :cascade do |t|
    t.float    "lat"
    t.float    "lng"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "date"
    t.string   "url_address"
    t.string   "url_title"
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "giver_id"
    t.string   "transaction_id", limit: 255
    t.decimal  "amount",                     precision: 50, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "givers", force: :cascade do |t|
    t.string   "message",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",        limit: 255
    t.string   "amount",       limit: 255
    t.boolean  "mailing_list"
    t.string   "first_name",   limit: 255
    t.string   "last_name",    limit: 255
    t.string   "address",      limit: 255
    t.string   "city",         limit: 255
    t.string   "state",        limit: 255
    t.string   "zip",          limit: 255
  end

end
