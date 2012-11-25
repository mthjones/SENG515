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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20121115062833) do
=======
ActiveRecord::Schema.define(:version => 20121124235901) do
>>>>>>> Removed Old User_sessions table

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

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rooms", :force => true do |t|
    t.string   "room_no"
    t.string   "location"
    t.string   "level"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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

<<<<<<< HEAD
=======
  create_table "sessions_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "session_id"
  end

  add_index "sessions_users", ["session_id", "user_id"], :name => "index_sessions_users_on_session_id_and_user_id"
  add_index "sessions_users", ["user_id", "session_id"], :name => "index_sessions_users_on_user_id_and_session_id"

  create_table "user_sessions", :force => true do |t|
    t.integer  "session_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

>>>>>>> added tables relationships started the subscribe to session button
  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "user_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "workshops", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
