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

ActiveRecord::Schema.define(version: 2020_03_29_013759) do

  create_table "friends", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "first_user_id"
    t.bigint "second_user_id"
    t.index ["first_user_id"], name: "index_friends_on_first_user_id"
    t.index ["second_user_id"], name: "index_friends_on_second_user_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_groups_on_admin_id"
  end

  create_table "invites", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "notified"
    t.string "invitation_status"
    t.bigint "user_id"
    t.bigint "order_id"
    t.index ["order_id"], name: "index_invites_on_order_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "meal"
    t.string "resturant"
    t.string "menu"
    t.string "order_status"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "user_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "item_name"
    t.integer "amount"
    t.decimal "price", precision: 10
    t.string "comment"
    t.bigint "user_id"
    t.bigint "order_id"
    t.index ["order_id"], name: "index_user_orders_on_order_id"
    t.index ["user_id"], name: "index_user_orders_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

  add_foreign_key "friends", "users", column: "first_user_id"
  add_foreign_key "friends", "users", column: "second_user_id"
  add_foreign_key "groups", "users", column: "admin_id"
  add_foreign_key "invites", "orders"
  add_foreign_key "invites", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "user_orders", "orders"
  add_foreign_key "user_orders", "users"
end