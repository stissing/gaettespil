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

ActiveRecord::Schema.define(:version => 20120312210838) do

  create_table "coupons", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "winner"
    t.integer  "home_score_a_1"
    t.integer  "away_score_a_1"
    t.integer  "home_score_a_2"
    t.integer  "away_score_a_2"
    t.integer  "home_score_a_3"
    t.integer  "away_score_a_3"
    t.integer  "home_score_a_4"
    t.integer  "away_score_a_4"
    t.integer  "home_score_a_5"
    t.integer  "away_score_a_5"
    t.integer  "home_score_a_6"
    t.integer  "away_score_a_6"
    t.integer  "home_score_b_1"
    t.integer  "away_score_b_1"
    t.integer  "home_score_b_2"
    t.integer  "away_score_b_2"
    t.integer  "home_score_b_3"
    t.integer  "away_score_b_3"
    t.integer  "home_score_b_4"
    t.integer  "away_score_b_4"
    t.integer  "home_score_b_5"
    t.integer  "away_score_b_5"
    t.integer  "home_score_b_6"
    t.integer  "away_score_b_6"
    t.integer  "home_score_c_1"
    t.integer  "away_score_c_1"
    t.integer  "home_score_c_2"
    t.integer  "away_score_c_2"
    t.integer  "home_score_c_3"
    t.integer  "away_score_c_3"
    t.integer  "home_score_c_4"
    t.integer  "away_score_c_4"
    t.integer  "home_score_c_5"
    t.integer  "away_score_c_5"
    t.integer  "home_score_c_6"
    t.integer  "away_score_c_6"
    t.integer  "home_score_d_1"
    t.integer  "away_score_d_1"
    t.integer  "home_score_d_2"
    t.integer  "away_score_d_2"
    t.integer  "home_score_d_3"
    t.integer  "away_score_d_3"
    t.integer  "home_score_d_4"
    t.integer  "away_score_d_4"
    t.integer  "home_score_d_5"
    t.integer  "away_score_d_5"
    t.integer  "home_score_d_6"
    t.integer  "away_score_d_6"
    t.boolean  "q_1"
    t.boolean  "s_1"
    t.boolean  "f_1"
    t.boolean  "w_1"
    t.boolean  "q_2"
    t.boolean  "s_2"
    t.boolean  "f_2"
    t.boolean  "w_2"
    t.boolean  "q_3"
    t.boolean  "s_3"
    t.boolean  "f_3"
    t.boolean  "w_3"
    t.boolean  "q_4"
    t.boolean  "s_4"
    t.boolean  "f_4"
    t.boolean  "w_4"
    t.boolean  "q_5"
    t.boolean  "s_5"
    t.boolean  "f_5"
    t.boolean  "w_5"
    t.boolean  "q_6"
    t.boolean  "s_6"
    t.boolean  "f_6"
    t.boolean  "w_6"
    t.boolean  "q_7"
    t.boolean  "s_7"
    t.boolean  "f_7"
    t.boolean  "w_7"
    t.boolean  "q_8"
    t.boolean  "s_8"
    t.boolean  "f_8"
    t.boolean  "w_8"
    t.boolean  "q_9"
    t.boolean  "s_9"
    t.boolean  "f_9"
    t.boolean  "w_9"
    t.boolean  "q_10"
    t.boolean  "s_10"
    t.boolean  "f_10"
    t.boolean  "w_10"
    t.boolean  "q_11"
    t.boolean  "s_11"
    t.boolean  "f_11"
    t.boolean  "w_11"
    t.boolean  "q_12"
    t.boolean  "s_12"
    t.boolean  "f_12"
    t.boolean  "w_12"
    t.boolean  "q_13"
    t.boolean  "s_13"
    t.boolean  "f_13"
    t.boolean  "w_13"
    t.boolean  "q_14"
    t.boolean  "s_14"
    t.boolean  "f_14"
    t.boolean  "w_14"
    t.boolean  "q_15"
    t.boolean  "s_15"
    t.boolean  "f_15"
    t.boolean  "w_15"
    t.boolean  "q_16"
    t.boolean  "s_16"
    t.boolean  "f_16"
    t.boolean  "w_16"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
