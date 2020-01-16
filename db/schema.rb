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

ActiveRecord::Schema.define(version: 20200116055853) do

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "admin", default: false
    t.boolean "superior", default: false
    t.string "affiliation"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.integer "employee_number"
    t.string "uid"
    t.datetime "basic_work_time"
    t.datetime "designated_work_start_time"
    t.datetime "designated_work_end_time"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee_number"], name: "index_users_on_employee_number", unique: true
  end

end
