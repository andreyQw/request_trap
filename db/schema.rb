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

ActiveRecord::Schema.define(version: 2018_06_23_201757) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "text"
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "req_infos", force: :cascade do |t|
    t.string "remote_ip"
    t.string "req_method"
    t.string "scheme", default: ""
    t.string "query_string", default: ""
    t.string "query_params", default: ""
    t.string "cookies"
    t.integer "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_req_infos_on_request_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "path_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
