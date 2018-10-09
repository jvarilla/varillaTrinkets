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

ActiveRecord::Schema.define(version: 20180315033523) do

  create_table "animals", force: :cascade do |t|
    t.string "species"
    t.string "kingdom"
    t.integer "numlegs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "emailMessage_id"
    t.boolean "viewedemail"
    t.boolean "clickedemailad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_messages", force: :cascade do |t|
    t.integer "page_id"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.text "occasion"
    t.boolean "isgift"
    t.text "boxmessage"
    t.string "tagmessage"
    t.string "tagfontcolor"
    t.string "tagcolor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shippingoption_id"
    t.date "orderdate"
    t.boolean "recipientisuser"
    t.string "shipaddress"
    t.string "shipcity"
    t.string "shipstate"
    t.string "shipzip"
    t.boolean "usefiledbillinfo"
    t.string "billaddress"
    t.string "billcity"
    t.string "billstate"
    t.string "billzip"
    t.integer "orderconfirmationnumber"
    t.string "cardmerchant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "saleprice"
  end

  create_table "page_visits", force: :cascade do |t|
    t.integer "user_id"
    t.integer "page_id"
    t.date "visitdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "url"
    t.string "typeofcontent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "page_id"
    t.integer "animal_id"
    t.integer "supplier_id"
    t.string "prodname"
    t.float "price"
    t.string "length"
    t.string "width"
    t.string "height"
    t.string "mainimg"
    t.string "frontimg"
    t.string "backimg"
    t.string "leftimg"
    t.string "rightimg"
    t.string "topimg"
    t.string "bottomimg"
    t.text "description"
    t.string "primarycolor"
    t.string "secondarycolor"
    t.boolean "hasbase"
    t.integer "numinstock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.string "promotiontitle"
    t.text "promotiondescription"
    t.string "desturl"
    t.string "adimage"
    t.date "startdate"
    t.date "enddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.string "title"
    t.text "comment"
    t.float "rating"
    t.date "postdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipping_options", force: :cascade do |t|
    t.string "optionname"
    t.string "shipclass"
    t.integer "minshiptime"
    t.integer "maxshiptime"
    t.string "shipprovider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "shippingprice"
    t.float "shipcost"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "suppliername"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "email"
    t.boolean "receiveemail"
    t.string "profileimage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "password_digest"
  end

  create_table "wish_lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.date "dateadded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
