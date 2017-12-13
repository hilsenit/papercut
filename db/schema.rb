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

ActiveRecord::Schema.define(version: 20171213092812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "type_of_thing"
    t.datetime "date"
    t.bigint "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_news_on_work_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "link"
    t.string "image"
    t.bigint "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_sources_on_work_id"
  end

  create_table "text_images", force: :cascade do |t|
    t.string "alt"
    t.string "hint"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "title"
    t.string "cover_image"
    t.text "description"
    t.text "made_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "short_description"
    t.integer "category", default: 0
    t.bigint "theme_id"
    t.string "type_of_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_image"
    t.string "created_by"
    t.string "photo_by"
    t.string "youtube_url"
    t.boolean "youtube_in_top", default: true
    t.boolean "youtube_in_bottom"
    t.string "soundcloud_url"
    t.boolean "soundcloud_in_top", default: true
    t.boolean "soundcloud_in_bottom"
    t.string "share_image"
    t.text "share_description"
    t.index ["theme_id"], name: "index_works_on_theme_id"
  end

  add_foreign_key "sources", "works"
end
