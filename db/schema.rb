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

  create_table "dailies", force: :cascade do |t|
    t.string "wban"
    t.string "yearMonthDay"
    t.string "tmax"
    t.string "tmin"
    t.string "tavg"
    t.string "depart"
    t.string "dewPoint"
    t.string "sunrise"
    t.string "sunset"
    t.string "codeSum"
    t.string "depth"
    t.string "snowFall"
    t.string "precipTotal"
    t.string "resultSpeed"
    t.string "resultDir"
    t.string "avgSpeed"
    t.string "max5Speed"
    t.string "max5Dir"
    t.string "max2Speed"
    t.string "max2Dir"
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
    t.string "skyCondition"
    t.string "visibility"
    t.string "weatherType"
    t.string "dryBulbFarenheit"
    t.string "dewPointFarenheit"
    t.string "relativeHumidity"
    t.string "windSpeed"
    t.string "windDirection"
    t.string "hourlyPrecip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monthlies", force: :cascade do |t|
    t.string "wban"
    t.string "yearMonth"
    t.string "avgMaxTemp"
    t.string "departureMaxTemp"
    t.string "avgMinTemp"
    t.string "departureMinTemp"
    t.string "avgTemp"
    t.string "departureFromNormal"
    t.string "totalMonthlyPrecip"
    t.string "departureFromNormalPrecip"
    t.string "totalSnowfall"
    t.string "max24HrSnowfall"
    t.string "dateMax24HrSnowfall"
    t.string "daysWithPrecip_GE_p01inch"
    t.string "daysWithPrecip_GE_p10inch"
    t.string "daysWithSnowfall_GE_1p0inch"
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
    t.string "groundHeight"
    t.string "stationHeight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "password_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
