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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130802014640) do

  create_table "courses", force: true do |t|
    t.string   "dept_code"
    t.integer  "course_no"
    t.string   "name"
    t.string   "term"
    t.integer  "year"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faculty_member_id"
  end

  create_table "faculty_members", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "position"
    t.string   "department"
    t.text     "summary"
    t.text     "biography"
    t.integer  "university_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "phone"
    t.string   "office"
  end

  create_table "publications", force: true do |t|
    t.string   "title"
    t.text     "summary"
    t.integer  "faculty_member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
    t.string   "image_url"
  end

  create_table "researches", force: true do |t|
    t.string   "topic"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faculty_member_id"
  end

end
