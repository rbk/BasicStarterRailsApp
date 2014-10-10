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

ActiveRecord::Schema.define(version: 20141010063433) do

  create_table "access_logs", force: true do |t|
    t.string   "outcome"
    t.string   "email"
    t.string   "ip_address"
    t.string   "http_user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checklists", force: true do |t|
    t.boolean  "analytics"
    t.boolean  "permalinks"
    t.boolean  "contact_forms"
    t.boolean  "site_url"
    t.boolean  "allow_robots"
    t.boolean  "css_compressed"
    t.boolean  "javascript_compressed"
    t.boolean  "redirects"
    t.boolean  "google_site_map"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checklists", ["site_id"], name: "index_checklists_on_site_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "user_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "rating"
    t.string   "read_time"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "sessions", force: true do |t|
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "group"
    t.string   "ip"
  end

  create_table "sites", force: true do |t|
    t.string   "server_name"
    t.string   "server_location"
    t.string   "ip"
    t.string   "repository"
    t.string   "domain"
    t.string   "dns"
    t.string   "email"
    t.text     "notes"
    t.boolean  "checklist_complete"
    t.boolean  "deployed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.integer  "age"
    t.string   "sex"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "login_count"
  end

end
