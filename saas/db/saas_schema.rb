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

ActiveRecord::Schema[8.2].define(version: 2025_12_16_000000) do
  create_table "account_billing_waivers", id: :uuid, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.uuid "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_billing_waivers_on_account_id", unique: true
  end

  create_table "account_overridden_limits", id: :uuid, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.uuid "account_id", null: false
    t.bigint "bytes_used"
    t.integer "card_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_overridden_limits_on_account_id", unique: true
  end

  create_table "account_subscriptions", id: :uuid, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.uuid "account_id", null: false
    t.datetime "cancel_at"
    t.datetime "created_at", null: false
    t.datetime "current_period_end"
    t.integer "next_amount_due_in_cents"
    t.string "plan_key"
    t.string "status"
    t.string "stripe_customer_id", null: false
    t.string "stripe_subscription_id"
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_subscriptions_on_account_id"
    t.index ["stripe_customer_id"], name: "index_account_subscriptions_on_stripe_customer_id", unique: true
    t.index ["stripe_subscription_id"], name: "index_account_subscriptions_on_stripe_subscription_id", unique: true
  end
end
