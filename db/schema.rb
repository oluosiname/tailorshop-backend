# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_819_090_510) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'add_uuid_to_models', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'addresses', force: :cascade do |t|
    t.integer 'addressable_id'
    t.string 'addressable_type'
    t.string 'address1'
    t.string 'address2'
    t.string 'city'
    t.string 'state'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'partner_id'
    t.string 'phone_number'
    t.string 'gender'
    t.string 'uuid'
    t.index ['partner_id'], name: 'index_customers_on_partner_id'
    t.index ['uuid'], name: 'index_customers_on_uuid', unique: true
  end

  create_table 'partners', force: :cascade do |t|
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name', null: false
    t.string 'uuid'
    t.index ['name'], name: 'index_partners_on_name', unique: true
    t.index ['user_id'], name: 'index_partners_on_user_id'
    t.index ['uuid'], name: 'index_partners_on_uuid', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password_digest'
    t.string 'token'
    t.datetime 'confirmed_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'uuid'
    t.index ['uuid'], name: 'index_users_on_uuid', unique: true
  end

  add_foreign_key 'customers', 'partners'
  add_foreign_key 'partners', 'users'
end
