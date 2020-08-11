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

ActiveRecord::Schema.define(version: 2020_08_11_134132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendship_requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "request_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "game_photos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.string "image_url"
    t.string "caption"
    t.integer "likes"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.integer "creator_id"
    t.integer "min_num_players"
    t.integer "max_num_players"
    t.integer "min_age"
    t.string "description"
    t.string "instructions_and_rules"
    t.string "image_url", default: ""
    t.string "link_to_game_website", default: ""
    t.string "game_category"
  end

  create_table "played_games", force: :cascade do |t|
    t.integer "host_id"
    t.integer "game_id"
    t.integer "num_team_or_players"
    t.string "status", default: "in_progress"
    t.string "winner", default: "undetermined"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.string "content"
    t.integer "num_stars"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.integer "age"
    t.string "fav_games"
    t.string "profile_url", default: ""
  end

end
