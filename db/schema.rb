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

ActiveRecord::Schema[7.0].define(version: 2023_08_03_130245) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "flyer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flyer_id"], name: "index_comments_on_flyer_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "flyer_tags", force: :cascade do |t|
    t.bigint "flyer_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flyer_id"], name: "index_flyer_tags_on_flyer_id"
    t.index ["tag_id"], name: "index_flyer_tags_on_tag_id"
  end

  create_table "flyers", force: :cascade do |t|
    t.string "title"
    t.text "requirement"
    t.text "searching_for"
    t.text "gathering_place"
    t.bigint "user_id", null: false
    t.integer "view_count"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_image"
    t.string "item_text"
    t.string "picture"
    t.string "picture_two"
    t.index ["user_id"], name: "index_flyers_on_user_id"
  end

  create_table "my_custom_taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_my_custom_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_my_custom_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_my_custom_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_my_custom_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_my_custom_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_my_custom_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_my_custom_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_my_custom_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_my_custom_taggings_on_tenant"
  end

  create_table "my_custom_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_my_custom_tags_on_name", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "flyers"
  add_foreign_key "comments", "users"
  add_foreign_key "flyer_tags", "flyers"
  add_foreign_key "flyer_tags", "tags"
  add_foreign_key "flyers", "users"
  add_foreign_key "my_custom_taggings", "my_custom_tags", column: "tag_id"
end
