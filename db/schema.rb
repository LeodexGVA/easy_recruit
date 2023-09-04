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

ActiveRecord::Schema[7.0].define(version: 2023_09_04_154336) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "status"
    t.bigint "job_offer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_offer_id"], name: "index_applications_on_job_offer_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "phone"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "score"
    t.string "comment"
    t.bigint "interview_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interview_id"], name: "index_feedbacks_on_interview_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "status"
    t.bigint "time_slot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_slot_id"], name: "index_interviews_on_time_slot_id"
  end

  create_table "job_offers", force: :cascade do |t|
    t.string "title"
    t.string "industry"
    t.string "description"
    t.string "address"
    t.string "skills"
    t.string "requirements"
    t.string "contract_type"
    t.date "start_date"
    t.date "end_date"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_job_offers_on_company_id"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "minimum_quota"
    t.integer "numbers"
    t.bigint "job_offer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_offer_id"], name: "index_steps_on_job_offer_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.string "status"
    t.bigint "application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_time_slots_on_application_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "address"
    t.string "linkedin_url"
    t.string "phone"
    t.boolean "admin"
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "job_offers"
  add_foreign_key "applications", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "feedbacks", "interviews"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "interviews", "time_slots"
  add_foreign_key "job_offers", "companies"
  add_foreign_key "steps", "job_offers"
  add_foreign_key "time_slots", "applications"
end
