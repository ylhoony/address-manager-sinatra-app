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

ActiveRecord::Schema.define(version: 20180123204120) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "dba"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.integer "country_id"
    t.string "postal_code"
    t.string "email"
    t.string "phone"
    t.integer "revenue_code"
  end

  create_table "company_addresses", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.string "dba"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.integer "country_id"
    t.string "postal_code"
    t.string "email"
    t.string "phone"
    t.boolean "is_billing_address", default: false
    t.boolean "is_shipping_address", default: false
    t.integer "company_contact_id"
  end

  create_table "company_contacts", force: :cascade do |t|
    t.integer "company_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "iso_2"
    t.string "iso_3"
    t.string "iso_numeric_3"
  end

  create_table "user_companies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.boolean "is_owner", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

end
