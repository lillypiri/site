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

ActiveRecord::Schema.define(version: 20160531004357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photos", force: :cascade do |t|
    t.string   "image_url"
    t.text     "caption"
    t.string   "tags"
    t.datetime "posted_at"
    t.string   "instagram_id"
    t.string   "external_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["instagram_id"], name: "index_photos_on_instagram_id", using: :btree
    t.index ["posted_at"], name: "index_photos_on_posted_at", using: :btree
    t.index ["tags"], name: "index_photos_on_tags", using: :btree
  end

  create_table "shop_items", force: :cascade do |t|
    t.string   "external_url"
    t.string   "title"
    t.string   "description"
    t.decimal  "price",        precision: 7, scale: 2
    t.string   "etsy_id"
    t.string   "image_url"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["etsy_id"], name: "index_shop_items_on_etsy_id", using: :btree
    t.index ["price"], name: "index_shop_items_on_price", using: :btree
    t.index ["title"], name: "index_shop_items_on_title", using: :btree
  end

end
