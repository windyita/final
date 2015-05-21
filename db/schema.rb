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

ActiveRecord::Schema.define(version: 0) do

  create_table "announcements", force: :cascade do |t|
    t.string  "title"
    t.text    "content"
    t.string  "date"
    t.integer "course_id"
  end

  add_index "announcements", ["course_id"], name: "index_announcements_on_course_id"

  create_table "answers", force: :cascade do |t|
    t.text    "content"
    t.integer "user_id"
    t.integer "question_id"
    t.string  "date"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "courses", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.string "year"
    t.string "quater"
    t.text   "description"
  end

  create_table "enrolls", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

  add_index "enrolls", ["course_id"], name: "index_enrolls_on_course_id"
  add_index "enrolls", ["user_id"], name: "index_enrolls_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.string  "title"
    t.text    "content"
    t.integer "user_id"
    t.integer "course_id"
    t.string  "date"
  end

  add_index "questions", ["course_id"], name: "index_questions_on_course_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "dept"
    t.string "email"
    t.string "role"
    t.string "passwd"
  end

end
