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

ActiveRecord::Schema.define(version: 20180123231303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "link"
    t.integer  "status",      default: 0
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "title"
    t.text     "description"
    t.integer  "length"
    t.string   "image"
    t.integer  "issue_id"
    t.integer  "user_id"
    t.integer  "tags"
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
    t.index ["issue_id"], name: "index_articles_on_issue_id", using: :btree
    t.index ["link"], name: "index_articles_on_link", unique: true, using: :btree
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "assistances", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_assistances_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_categories_on_slug", using: :btree
  end

  create_table "issues", force: :cascade do |t|
    t.date     "issued_at"
    t.integer  "guid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "podcasts", force: :cascade do |t|
    t.integer  "episode"
    t.string   "title"
    t.string   "slug"
    t.string   "video_link"
    t.string   "audio_link"
    t.string   "image"
    t.string   "thumbnail"
    t.text     "text"
    t.text     "guests"
    t.text     "quote"
    t.integer  "reading_time", default: 30
    t.date     "published"
    t.integer  "status",       default: 0
    t.integer  "tags",         default: 0
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["category_id"], name: "index_podcasts_on_category_id", using: :btree
    t.index ["episode"], name: "index_podcasts_on_episode", using: :btree
    t.index ["slug"], name: "index_podcasts_on_slug", using: :btree
    t.index ["title"], name: "index_podcasts_on_title", using: :btree
    t.index ["user_id"], name: "index_podcasts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "role",            default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "id_facebook"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "issues"
  add_foreign_key "articles", "users"
  add_foreign_key "assistances", "users"
  add_foreign_key "podcasts", "categories"
  add_foreign_key "podcasts", "users"
end
