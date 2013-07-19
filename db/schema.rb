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

ActiveRecord::Schema.define(:version => 20130719175629) do

  create_table "books", :force => true do |t|
    t.string   "title",       :limit => 32, :null => false
    t.float    "price"
    t.integer  "subject_id"
    t.text     "description"
    t.datetime "created_at"
  end

  create_table "children", :primary_key => "child_tc_id", :force => true do |t|
    t.string   "agent"
    t.string   "content"
    t.text     "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "parent_tc_id"
  end

  create_table "defects", :force => true do |t|
    t.integer  "project_id"
    t.integer  "req_id"
    t.integer  "parent_tc_id"
    t.string   "def_description"
    t.string   "tester_name"
    t.string   "dev_name"
    t.string   "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "category"
    t.string   "severity"
  end

  create_table "defectseverities", :force => true do |t|
    t.string "severity"
  end

  create_table "defecttypes", :force => true do |t|
    t.string "category"
  end

  create_table "logins", :force => true do |t|
    t.string   "user"
    t.string   "password"
    t.text     "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :primary_key => "parent_tc_id", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "agent",      :limit => 30
    t.string   "status",     :limit => 30
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "requirements", :force => true do |t|
    t.integer  "project_id"
    t.integer  "parent_tc_id"
    t.string   "title"
    t.string   "req_description"
    t.string   "tester_assigned"
    t.string   "dev_assigned"
    t.string   "prod_owner"
    t.string   "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string "name"
  end

  create_table "subjects", :force => true do |t|
    t.string "name"
  end

end
