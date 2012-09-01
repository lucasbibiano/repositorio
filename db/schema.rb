# -*- encoding : utf-8 -*-
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

ActiveRecord::Schema.define(:version => 20120821221601) do

  create_table "admin_competitions", :force => true do |t|
    t.string   "name"
    t.string   "sex"
    t.integer  "max_age"
    t.integer  "min_age"
    t.integer  "max_per_org"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "admin_organizations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "athletes_competitions", :id => false, :force => true do |t|
    t.integer "athlete_id"
    t.integer "competition_id"
  end

  add_index "athletes_competitions", ["athlete_id", "competition_id"], :name => "index_athletes_competitions_on_athlete_id_and_competition_id"
  add_index "athletes_competitions", ["competition_id", "athlete_id"], :name => "index_athletes_competitions_on_competition_id_and_athlete_id"

  create_table "representante_athletes", :force => true do |t|
    t.string   "name"
    t.string   "sex"
    t.integer  "age"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "representante_athletes", ["organization_id"], :name => "index_representante_athletes_on_organization_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_admin"
    t.integer  "organization_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
