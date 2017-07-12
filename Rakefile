require_relative 'config/application'

Rails.application.load_tasks

def scrape_stations(file, t)

  count, array = 0, []
  puts "\n#{file} migration starting at #{t}"
  puts "---------"

  File.foreach(file) do |row|
    unless row[0] == "|"
      split_row = row.split("|")
      split_row.map! { |x| ActiveRecord::Base.connection.quote(x) }

      if row != File.foreach(file).first
        wban, wmo, callsign, climateDivisionCode, climateDivisionStateCode, climateDivisionStationcode, name, state, location, latitude, longitude, groundHeight, stationHeight, barometer, timezone = split_row

        time = ActiveRecord::Base.connection.quote(Time.now)
        array << "(#{wban}, #{location}, #{callsign}, #{state}, #{name}, #{latitude}, #{longitude}, #{groundHeight}, #{stationHeight}, #{time}, #{time})"
      end
    end

    count += 1
    $total_count += 1

  end

  sql = "INSERT INTO stations (wban, name, callsign, state, location, latitude, longitude, ground_height, station_height, created_at, updated_at) VALUES " + array.join(", ")
  ActiveRecord::Base.connection.execute(sql)

  puts "---------"
  puts "#{count} entries from this file were added, with #{$total_count} total entries."

end

def scrape_hourlies(file, t)

  count, array = 0, []
  puts "\n#{file} migration starting at #{t}"
  puts "---------"

  File.foreach(file) do |row|
    split_row = row.split(",")
    split_row.map! { |x| ActiveRecord::Base.connection.quote(x) }

    if row != File.foreach(file).first
      wban, date, time, stationType, skyCondition, skyConditionFlag, visibility, visibilityFlag, weatherType, weatherTypeFlag, dryBulbFarenheit, dryBulbFarenheitFlag, dryBulbCelsius, dryBulbCelsiusFlag, wetBulbFarenheit, wetBulbFarenheitFlag, wetBulbCelsius, wetBulbCelsiusFlag, dewPointFarenheit, dewPointFarenheitFlag, dewPointCelsius, dewPointCelsiusFlag, relativeHumidity, relativeHumidityFlag, windSpeed, windSpeedFlag, windDirection, windDirectionFlag, valueForWindCharacter, valueForWindCharacterFlag, stationPressure, stationPressureFlag, pressureTendency, pressureTendencyFlag, pressureChange, pressureChangeFlag, seaLevelPressure, seaLevelPressureFlag, recordType, recordTypeFlag, hourlyPrecip, hourlyPrecipFlag, altimeter, altimeterFlag = split_row

      time = ActiveRecord::Base.connection.quote(Time.now)
      array << "(#{wban}, #{date}, #{time}, #{skyCondition}, #{visibility}, #{weatherType}, #{dryBulbFarenheit}, #{dewPointFarenheit}, #{relativeHumidity}, #{windSpeed}, #{windDirection}, #{hourlyPrecip}, #{time}, #{time})"

    end

    count += 1
    $total_count += 1
    puts "#{Time.now - t} s: #{count} entries added" if count % 10000 == 0

    # because it's such a large file, chunk out the SQL calls which cuts down on end-time
    if count % 200000 == 0
      sql = "INSERT INTO hourlies (wban, date, time, sky_condition, visibility, weather_type, dry_bulb_farenheit, dew_point_farenheit, relative_humidity, wind_speed, wind_direction, hourly_precip, created_at, updated_at) VALUES " + array.join(", ")
      puts "============= Seeding 200,000 rows ============="
      ActiveRecord::Base.connection.execute(sql)
      puts "============= #{Hourly.all.count} rows are now in the database ============="
      array = []
    end

  end

  sql = "INSERT INTO hourlies (wban, date, time, sky_condition, visibility, weather_type, dry_bulb_farenheit, dew_point_farenheit, relative_humidity, wind_speed, wind_direction, hourly_precip, created_at, updated_at) VALUES " + array.join(", ")
  ActiveRecord::Base.connection.execute(sql)

  puts "---------"
  puts "#{count} entries from this file were added, with #{$total_count} total entries."

end


def scrape_dailies(file, t)

  count, array = 0, []
  puts "\n#{file} migration starting at #{t}"
  puts "---------"

  File.foreach(file) do |row|
    split_row = row.split(",")
    split_row.map! { |x| ActiveRecord::Base.connection.quote(x) }

    if row != File.foreach(file).first
      wban, yearMonthDay, tmax, tmaxFlag, tmin, tminFlag, tavg, tavgFlag, depart, departFlag, dewPoint, dewPointFlag, wetBulb, wetBulbFlag, heat, heatFlag, cool, coolFlag, sunrise, sunriseFlag, sunset, sunsetFlag, codeSum, codeSumFlag, depth, depthFlag, water1, water1Flag, snowFall, snowFallFlag, precipTotal, precipTotalFlag, stnPressure, stnPressureFlag, seaLevel, seaLevelFlag, resultSpeed, resultSpeedFlag, resultDir, resultDirFlag, avgSpeed, avgSpeedFlag, max5Speed, max5SpeedFlag, max5Dir, max5DirFlag, max2Speed, max2SpeedFlag, max2Dir, max2DirFlag = split_row

      time = ActiveRecord::Base.connection.quote(Time.now)
      array << "(#{wban}, #{yearMonthDay}, #{tmax}, #{tmin}, #{tavg}, #{depart}, #{dewPoint}, #{sunrise}, #{sunset}, #{codeSum}, #{depth}, #{snowFall}, #{precipTotal}, #{resultSpeed}, #{resultDir}, #{avgSpeed}, #{max5Speed}, #{max5Dir}, #{max2Speed}, #{max2Dir}, #{time}, #{time})"
    end

    count += 1
    $total_count += 1
    puts "#{Time.now - t} s: #{count} entries added" if count % 5000 == 0

  end

  sql = "INSERT INTO dailies (wban, year_month_day, tmax, tmin, tavg, depart, dew_point, sunrise, sunset, code_sum, depth, snow_fall, precip_total, result_speed, result_dir, avg_speed, max5_speed, max5_dir, max2_speed, max2_dir, created_at, updated_at) VALUES " + array.join(", ")
  ActiveRecord::Base.connection.execute(sql)

  puts "---------"
  puts "#{count} entries from this file were added, with #{$total_count} total entries."

end

def scrape_monthlies(file, t)

  count, array = 0, []
  puts "\n#{file} migration starting at #{t}"
  puts "---------"

  File.foreach(file) do |row|
    split_row = row.split(",")
    split_row.map! { |x| ActiveRecord::Base.connection.quote(x) }

    if row != File.foreach(file).first
      wban, yearMonth, avgMaxTemp, departureMaxTemp, avgMinTemp, departureMinTemp, avgTemp, departureFromNormal, avgDewPoint, avgWetBulb, heatingDegreeDays, coolingDegreeDays, hDDMonthlyDeparture, cDDMonthlyDeparture, hDDSeasonToDate, cDDSeasonToDate, hDDSeasonToDateDeparture, cDDSeasonToDateDeparture, meanStationPressure, meanSeaLevelPressure, maxSeaLevelPressure, dateMaxSeaLevelPressure, timeMaxSeaLevelPressure, minSeaLevelPressure, dateMinSeaLevelPressure, timeMinSeaLevelPressure, totalMonthlyPrecip, departureFromNormalPrecip, max24HrPrecip, dateMax24HrPrecip, totalSnowfall, max24HrSnowfall, dateMax24HrSnowfall, max12ZSnowDepth, dateMax12ZSnowDepth, maxTemp_GE_90Days, maxTemp_LE_32Days, minTemp_LE_32Days, minTemp_LE_0Days, thunderstormDays, heavyFogDays, daysWithPrecip_GE_p01inch, daysWithPrecip_GE_p10inch, daysWithSnowfall_GE_1p0inch, waterEquivalent, resultantWindSpeed, resultantWindDirection, avgWindSpeed, avgHDD, avgCDD = split_row

      time = ActiveRecord::Base.connection.quote(Time.now)
      array << "(#{wban}, #{yearMonth}, #{avgMaxTemp}, #{departureMaxTemp}, #{avgMinTemp}, #{departureMinTemp}, #{avgTemp}, #{departureFromNormal}, #{totalMonthlyPrecip}, #{departureFromNormalPrecip}, #{max24HrPrecip}, #{dateMax24HrPrecip}, #{totalSnowfall}, #{max24HrSnowfall}, #{dateMax24HrSnowfall}, #{daysWithPrecip_GE_p01inch}, #{daysWithPrecip_GE_p10inch}, #{daysWithSnowfall_GE_1p0inch}, #{time}, #{time})"
    end

    count += 1
    $total_count += 1
    puts "#{Time.now - t} s: #{count} entries added" if count % 1000 == 0

  end

  sql = "INSERT INTO monthlies (wban, year_month, avg_max_temp, departure_max_temp, avg_min_temp, departure_min_temp, avg_temp, departure_from_normal, total_monthly_precip, departure_from_normal_precip, max24_hr_precip, date_max24_hr_precip, total_snowfall, max24_hr_snowfall, date_max24_hr_snowfall, days_with_precip_ge_p01inch, days_with_precip_ge_p10inch, days_with_snowfall_ge_1p0inch, created_at, updated_at) VALUES " + array.join(", ")
  ActiveRecord::Base.connection.execute(sql)

  puts "---------"
  puts "#{count} entries from this file were added, with #{$total_count} total entries."

end

yy = ("07".."17").to_a
mm = ("01".."12").to_a
file_yymm = yy.product(mm).map { |y,m| y+m }[4..-7]

namespace :app do

  desc "reset and prep for scraping"
  task :scrape_prep => :environment do
    system("rake db:drop")
    system("rake db:create")
    system("rake db:migrate")
    system("rake db:migrate RAILS_ENV=development")
    puts 'Ready for scraping'
  end

  desc "scrape stations"
  task :scrape_stations => :environment do
    t, $total_count, pre_count = Time.now, 0, Station.all.count
    scrape_stations("/Users/flatironschool/Downloads/QCLCD_Gathered/201706station.txt", t)
    scrape_stations("/Users/flatironschool/Downloads/QCLCD_Gathered/200705station.txt", t)
    # delete duplicates by WBAN
    ActiveRecord::Base.connection.execute("DELETE FROM stations WHERE id NOT IN (SELECT MAX(id) FROM stations GROUP BY wban)")
    ActiveRecord::Base.connection.execute("DELETE FROM stations WHERE callsign = '' ")
    total = (Time.now - t).floor
    puts "\nMigration ended at #{Time.now} and took #{(total / 60).floor} minutes #{total % 60} seconds."
    puts "There are now #{Station.all.count} stations, averaging #{(Station.all.count - pre_count) / total} datapoints per second."
  end

  desc "scrape hourlies"
  task :scrape_hourlies => :environment do
    t, $total_count = Time.now, 0
    scrape_hourlies("/Users/flatironschool/Downloads/QCLCD_Gathered/201403hourly.txt", t)
    scrape_hourlies("/Users/flatironschool/Downloads/QCLCD_Gathered/201402hourly.txt", t)
    scrape_hourlies("/Users/flatironschool/Downloads/QCLCD_Gathered/201401hourly.txt", t)
    total = (Time.now - t).floor
    puts "\nMigration ended at #{Time.now} and took #{(total / 60).floor} minutes #{total % 60} seconds)."
    puts "There are now #{Hourly.all.count} hourly datapoints, averaging #{Hourly.all.count / total} datapoints per second."
  end

  desc "scrape dailies"
  task :scrape_dailies => :environment do
    t, $total_count = Time.now, 0
    file_yymm.each { |x| scrape_dailies("/Users/flatironschool/Downloads/QCLCD_Gathered/20" + x + "daily.txt", t) }
    total = (Time.now - t).floor
    puts "\nMigration ended at #{Time.now} and took #{(total / 60).floor} minutes #{total % 60} seconds)."
    puts "There are now #{Daily.all.count} daily datapoints, averaging #{Daily.all.count / total} datapoints per second."
  end

  desc "scrape monthlies"
  task :scrape_monthlies => :environment do
    t, $total_count = Time.now, 0
    file_yymm.each { |x| scrape_monthlies("/Users/flatironschool/Downloads/QCLCD_Gathered/20" + x + "monthly.txt", t) }
    total = (Time.now - t).floor
    puts "\nMigration ended at #{Time.now} and took #{(total / 60).floor} minutes #{total % 60} seconds)."
    puts "There are now #{Monthly.all.count} monthly datapoints, averaging #{Monthly.all.count / total} datapoints per second."
  end
end
