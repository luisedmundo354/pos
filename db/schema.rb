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

ActiveRecord::Schema.define(version: 2018_09_17_041313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.integer "phone"
    t.integer "dni"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "unit"
    t.float "stock"
    t.float "ss"
    t.integer "deliver_time"
    t.integer "order_size"
    t.string "level"
    t.text "commentary"
    t.bigint "category_id"
    t.bigint "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "upc"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "purchase_items", force: :cascade do |t|
    t.float "price"
    t.integer "quantity"
    t.bigint "product_id"
    t.bigint "purchase_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_purchase_items_on_product_id"
    t.index ["purchase_order_id"], name: "index_purchase_items_on_purchase_order_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.integer "number"
    t.text "comment"
    t.bigint "replenisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["replenisher_id"], name: "index_purchase_orders_on_replenisher_id"
  end

  create_table "replenishers", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.integer "phone"
    t.integer "dni"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_items", force: :cascade do |t|
    t.float "price"
    t.integer "quantity"
    t.bigint "product_id"
    t.bigint "sale_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sale_items_on_product_id"
    t.index ["sale_order_id"], name: "index_sale_items_on_sale_order_id"
  end

  create_table "sale_orders", force: :cascade do |t|
    t.integer "number"
    t.text "comment"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_sale_orders_on_customer_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "manager"
    t.integer "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
