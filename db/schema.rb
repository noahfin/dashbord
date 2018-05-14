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

ActiveRecord::Schema.define(version: 20180514134008) do

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.string "email"
    t.string "phone"
    t.string "cell"
    t.string "address"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "county"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.text "notes"
    t.string "city"
    t.string "street_num"
    t.string "strret_name"
    t.string "title"
    t.integer "user_id"
    t.integer "role"
    t.boolean "verified"
    t.string "web_address"
    t.string "zip_code_ext"
    t.string "facility_size"
    t.string "latitude"
    t.string "year_of_Founding"
    t.string "owns_cents"
    t.string "primary_industry"
    t.string "sic"
    t.string "longitude"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "suffix"
    t.string "postion"
    t.string "type"
    t.string "prefix"
    t.string "total_number_of_employees"
    t.index ["group_id"], name: "index_contacts_on_group_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "contacts_deals", id: false, force: :cascade do |t|
    t.integer "deal_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "deal_id"], name: "index_contacts_deals_on_contact_id_and_deal_id"
    t.index ["deal_id", "contact_id"], name: "index_contacts_deals_on_deal_id_and_contact_id"
  end

  create_table "contacts_groups", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "group_id"], name: "index_contacts_groups_on_contact_id_and_group_id"
    t.index ["group_id", "contact_id"], name: "index_contacts_groups_on_group_id_and_contact_id"
  end

  create_table "contacts_properties", id: false, force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "property_id"], name: "index_contacts_properties_on_contact_id_and_property_id"
    t.index ["property_id", "contact_id"], name: "index_contacts_properties_on_property_id_and_contact_id"
  end

  create_table "contacts_tasks", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "task_id"], name: "index_contacts_tasks_on_contact_id_and_task_id"
    t.index ["task_id", "contact_id"], name: "index_contacts_tasks_on_task_id_and_contact_id"
  end

  create_table "contacts_users", id: false, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "user_id", null: false
    t.index ["contact_id", "user_id"], name: "index_contacts_users_on_contact_id_and_user_id"
    t.index ["user_id", "contact_id"], name: "index_contacts_users_on_user_id_and_contact_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "author_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deals", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.index ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id"
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id"
  end

  create_table "issues", force: :cascade do |t|
    t.integer "user_id"
    t.integer "property_id"
    t.string "severity"
    t.string "status", default: "REPORTED"
    t.text "comment"
    t.integer "deal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_issues_on_deal_id"
    t.index ["property_id"], name: "index_issues_on_property_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "business"
    t.string "address"
    t.string "email"
    t.string "date"
    t.string "phone"
    t.string "number"
    t.string "size_requirement"
    t.string "location_need"
    t.string "time_requirement"
    t.text "notes"
    t.boolean "active"
    t.integer "contact_id"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["contact_id"], name: "index_leads_on_contact_id"
    t.index ["property_id"], name: "index_leads_on_property_id"
  end

  create_table "personal_messages", force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
    t.index ["user_id"], name: "index_personal_messages_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "property_id"
    t.integer "deal_id"
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_posts_on_deal_id"
    t.index ["property_id"], name: "index_posts_on_property_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "rental_rate"
    t.string "price"
    t.string "year_built"
    t.string "building_class"
    t.string "lease_type"
    t.string "overhead_doors"
    t.string "loading_docks"
    t.string "min_divisible"
    t.string "space_use"
    t.string "space_available"
    t.string "date_available"
    t.string "property_type"
    t.string "address"
    t.text "description"
    t.boolean "for_lease"
    t.boolean "for_sale"
    t.string "owner_name"
    t.string "county"
    t.string "zip_code"
  end

  create_table "properties_tasks", id: false, force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "task_id", null: false
    t.index ["property_id", "task_id"], name: "index_properties_tasks_on_property_id_and_task_id"
    t.index ["task_id", "property_id"], name: "index_properties_tasks_on_task_id_and_property_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "task_id", null: false
    t.index ["task_id", "user_id"], name: "index_tasks_users_on_task_id_and_user_id"
    t.index ["user_id", "task_id"], name: "index_tasks_users_on_user_id_and_task_id"
  end

  create_table "touches", force: :cascade do |t|
    t.boolean "email"
    t.boolean "phone"
    t.boolean "postcard"
    t.boolean "social_media"
    t.boolean "in_person"
    t.boolean "letter"
    t.text "description"
    t.integer "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_touches_on_contact_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "role"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "first_name"
    t.string "last_name"
    t.boolean "employee"
    t.boolean "customer"
    t.string "street_name"
    t.string "street_num"
    t.string "city"
    t.string "county"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
