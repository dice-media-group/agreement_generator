# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_07_165126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", force: :cascade do |t|
    t.string "provider_rep_name"
    t.text "provider_signature"
    t.date "provider_signed_on"
    t.string "client_rep_name"
    t.text "client_rep_signature"
    t.date "client_signed_on"
    t.binary "signature"
    t.datetime "signed_on"
    t.bigint "user_id", null: false
    t.bigint "document_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "project_id"
    t.index ["document_id"], name: "index_agreements_on_document_id"
    t.index ["user_id"], name: "index_agreements_on_user_id"
  end

  create_table "announcements", force: :cascade do |t|
    t.datetime "published_at"
    t.string "announcement_type"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_details", force: :cascade do |t|
    t.string "business_name"
    t.string "street_address_01"
    t.string "business_street_address_02"
    t.string "business_city"
    t.string "business_state"
    t.string "business_postal_code"
    t.string "business_phone"
    t.string "name_of_representative"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "document_id", null: false
    t.string "role"
    t.index ["document_id"], name: "index_contact_details_on_document_id"
  end

  create_table "deliverables", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "agreement_id", null: false
    t.string "description"
    t.index ["agreement_id"], name: "index_deliverables_on_agreement_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "main_body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "recipient_id"
    t.bigint "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.bigint "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_schedules", force: :cascade do |t|
    t.bigint "document_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_id"], name: "index_payment_schedules_on_document_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "date"
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "agreement_id", null: false
    t.index ["agreement_id"], name: "index_payments_on_agreement_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "organization"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_users", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scheduled_payments", force: :cascade do |t|
    t.date "due_date"
    t.decimal "amount"
    t.bigint "agreement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agreement_id"], name: "index_scheduled_payments_on_agreement_id"
  end

  create_table "scope_documents", force: :cascade do |t|
    t.string "project_name"
    t.bigint "document_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_id"], name: "index_scope_documents_on_document_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "boilerplate_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "announcements_last_read_at"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "agreements", "documents"
  add_foreign_key "agreements", "users"
  add_foreign_key "contact_details", "documents"
  add_foreign_key "deliverables", "agreements"
  add_foreign_key "payment_schedules", "documents"
  add_foreign_key "payments", "agreements"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "scheduled_payments", "agreements"
  add_foreign_key "scope_documents", "documents"
  add_foreign_key "services", "users"
end
