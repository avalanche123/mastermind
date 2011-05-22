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

ActiveRecord::Schema.define(:version => 20110521222610) do

  create_table "games", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "won"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["user_id"], :name => "index_games_on_user_id"
  add_index "games", ["won"], :name => "index_games_on_won"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",  :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "games_won",                             :default => 0
    t.integer  "games_lost",                            :default => 0
    t.decimal  "average_guess_count",                   :default => 0.0
  end

  add_index "users", ["average_guess_count"], :name => "index_users_on_average_guess_count"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["games_lost"], :name => "index_users_on_games_lost"
  add_index "users", ["games_won"], :name => "index_users_on_games_won"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
