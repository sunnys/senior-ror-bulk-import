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

ActiveRecord::Schema.define(version: 2019_05_20_082356) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.integer "lft", default: 0, null: false
    t.integer "rgt", default: 0, null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "employees_policies", id: false, force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "policy_id", null: false
    t.index ["employee_id", "policy_id"], name: "index_employees_policies_on_employee_id_and_policy_id"
    t.index ["policy_id", "employee_id"], name: "index_employees_policies_on_policy_id_and_employee_id"
  end

  create_table "policies", force: :cascade do |t|
    t.string "name"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_policies_on_company_id"
  end

end
