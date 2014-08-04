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

ActiveRecord::Schema.define(version: 20140711200841) do

  create_table "cards", force: true do |t|
    t.integer  "card_number"
    t.string   "fname"
    t.string   "lname"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "card_type"
  end

  add_index "cards", ["user_id"], name: "index_cards_on_user_id"

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.string   "ship_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
    t.boolean  "purchased"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "orders_products", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  add_index "orders_products", ["order_id"], name: "index_orders_products_on_order_id"
  add_index "orders_products", ["product_id"], name: "index_orders_products_on_product_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
