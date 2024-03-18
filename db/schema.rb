# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_18_153117) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "url"
    t.string "job_title"
    t.text "notes"
    t.integer "total_comp"
    t.integer "company_tier"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_applications_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.text "notes"
    t.integer "tenure"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "type"
    t.string "stage"
    t.datetime "scheduled_at"
    t.text "notes"
    t.bigint "contact_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_interviews_on_company_id"
    t.index ["contact_id"], name: "index_interviews_on_contact_id"
  end

  create_table "retrospectives", force: :cascade do |t|
    t.text "notes"
    t.integer "score"
    t.bigint "interview_id", null: false
    t.bigint "application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_retrospectives_on_application_id"
    t.index ["interview_id"], name: "index_retrospectives_on_interview_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "applications", "companies"
  add_foreign_key "contacts", "companies"
  add_foreign_key "interviews", "companies"
  add_foreign_key "interviews", "contacts"
  add_foreign_key "retrospectives", "applications"
  add_foreign_key "retrospectives", "interviews"
end
