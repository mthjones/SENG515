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

ActiveRecord::Schema.define(:version => 20121205191600) do

  create_table "budgets", :force => true do |t|
    t.integer  "workshop_id"
    t.decimal  "accomodation_cost", :precision => 10, :scale => 2
    t.decimal  "venue_cost",        :precision => 10, :scale => 2
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "budgets", ["workshop_id"], :name => "index_budgets_on_workshop_id"

  create_table "equipment", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "equipment_rooms", :id => false, :force => true do |t|
    t.integer "room_id"
    t.integer "equipment_id"
  end

  add_index "equipment_rooms", ["equipment_id", "room_id"], :name => "index_equipment_rooms_on_equipment_id_and_room_id"
  add_index "equipment_rooms", ["room_id", "equipment_id"], :name => "index_equipment_rooms_on_room_id_and_equipment_id"

  create_table "expenses", :force => true do |t|
    t.integer  "budget_id"
    t.string   "name"
    t.decimal  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "expenses", ["budget_id"], :name => "index_expenses_on_budget_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "admin_only"
  end

  create_table "rooms", :force => true do |t|
    t.integer  "room_no",     :limit => 255
    t.string   "location"
    t.string   "level"
    t.text     "description"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "title"
    t.text     "description",    :limit => 255
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "workshop_id"
    t.integer  "room_id"
  end

  create_table "sessions_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "session_id"
  end

  add_index "sessions_users", ["session_id", "user_id"], :name => "index_sessions_users_on_session_id_and_user_id"
  add_index "sessions_users", ["user_id", "session_id"], :name => "index_sessions_users_on_user_id_and_session_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.boolean  "verified"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workshops", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
