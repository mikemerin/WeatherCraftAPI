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

ActiveRecord::Schema.define(version: 20170626232634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dailies", force: :cascade do |t|
    t.string "wban"
    t.string "year_month_day"
    t.string "tmax"
    t.string "tmin"
    t.string "tavg"
    t.string "depart"
    t.string "dew_point"
    t.string "sunrise"
    t.string "sunset"
    t.string "code_sum"
    t.string "depth"
    t.string "snow_fall"
    t.string "precip_total"
    t.string "result_speed"
    t.string "result_dir"
    t.string "avg_speed"
    t.string "max5_speed"
    t.string "max5_dir"
    t.string "max2_speed"
    t.string "max2_dir"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.string "user_id"
    t.string "station_id"
    t.string "daily_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hourlies", force: :cascade do |t|
    t.string "wban"
    t.string "date"
    t.string "time"
    t.string "sky_condition"
    t.string "visibility"
    t.string "weather_type"
    t.string "dry_bulb_farenheit"
    t.string "dew_point_farenheit"
    t.string "relative_humidity"
    t.string "wind_speed"
    t.string "wind_direction"
    t.string "hourly_precip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monthlies", force: :cascade do |t|
    t.string "wban"
    t.string "year_month"
    t.string "avg_max_temp"
    t.string "departure_max_temp"
    t.string "avg_min_temp"
    t.string "departure_min_temp"
    t.string "avg_temp"
    t.string "departure_from_normal"
    t.string "total_monthly_precip"
    t.string "departure_from_normal_precip"
    t.string "max24_hr_precip"
    t.string "date_max24_hr_precip"
    t.string "total_snowfall"
    t.string "max24_hr_snowfall"
    t.string "date_max24_hr_snowfall"
    t.string "days_with_precip_ge_p01inch"
    t.string "days_with_precip_ge_p10inch"
    t.string "days_with_snowfall_ge_1p0inch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "wban"
    t.string "name"
    t.string "callsign"
    t.string "state"
    t.string "location"
    t.string "latitude"
    t.string "longitude"
    t.string "ground_height"
    t.string "station_height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "password_confirmation"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
