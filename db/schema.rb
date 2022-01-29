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

ActiveRecord::Schema.define(version: 20181227002643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.integer "user_id"
    t.string "full_name"
    t.string "kinship_degree"
    t.string "home_phone"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "observation"
  end

  create_table "health_insurances", force: :cascade do |t|
    t.integer "user_id"
    t.string "company"
    t.string "plan"
    t.string "card_number"
    t.date "validity"
    t.string "preferably_hospital"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pendencies", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "settled", default: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pendencies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "nickname"
    t.string "rg"
    t.string "cpf"
    t.date "birth"
    t.string "zip_code"
    t.string "state"
    t.string "city"
    t.string "neighborhood"
    t.string "address"
    t.string "number"
    t.string "email"
    t.string "secondary_email"
    t.string "phone"
    t.string "home_phone"
    t.string "another_phone"
    t.string "facebook_link"
    t.string "whatsapp"
    t.string "injuries_history"
    t.string "drug_restrictions"
    t.string "chronic_diseases"
    t.string "training_availability"
    t.string "donation_availability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
    t.boolean "has_health_insurance", default: false
    t.string "complement"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "agree_with_terms_of_statute", default: false
    t.boolean "agree_with_terms_of_athlete_manual", default: false
    t.string "sex"
    t.datetime "last_update_at"
    t.datetime "last_age_registration_email_send_at"
    t.string "blood_type"
    t.boolean "supporter", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
