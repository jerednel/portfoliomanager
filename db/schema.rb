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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140409181242) do

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mgmt_co"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  create_table "contacts_hotels", :id => false, :force => true do |t|
    t.integer "contact_id"
    t.integer "hotel_id"
  end

  create_table "hotels", :force => true do |t|
    t.string   "inncode"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "global_web_url"
    t.string   "local_web_url"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "phone"
  end

  create_table "hotels_tasks", :id => false, :force => true do |t|
    t.integer "hotel_id"
    t.integer "task_id"
  end

  create_table "hotels_users", :id => false, :force => true do |t|
    t.integer "hotel_id"
    t.integer "user_id"
  end

  create_table "notes", :force => true do |t|
    t.text    "note_detail"
    t.integer "hotel_id"
    t.string  "string"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "status",     :default => "open"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
