# rake db:drop && rake db:create && rake db:migrate && rake db:migrate RAILS_ENV=development

require_relative 'config/application'

Rails.application.load_tasks

def scrape_stations(file, t)

  File.foreach(file) do |row|
    unless row[0] == "|"
      split_row = row.split("|")

      if row != File.foreach(file).first
        wban, wmo, callsign, climateDivisionCode, climateDivisionStateCode, climateDivisionStationcode, name, state, location, latitude, longitude, groundHeight, stationHeight, barometer, timezone = split_row
        Station.create(wban: wban, callsign: callsign, name: name, state: state, location: location, latitude: latitude, longitude: longitude, groundHeight: groundHeight, stationHeight: stationHeight)
      end
    end
  end
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
    puts "#{Time.now - t} s: #{count} entries added" if count % 250 == 0

  end

  sql = "INSERT INTO hourlies (wban, date, time, skyCondition, visibility, weatherType, dryBulbFarenheit, dewPointFarenheit, relativeHumidity, windSpeed, windDirection, hourlyPrecip, created_at, updated_at) VALUES " + array.join(", ")
  ActiveRecord::Base.connection.execute(sql)

  puts "---------"
  puts "#{count} total entries added."

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
    puts "#{Time.now - t} s: #{count} entries added" if count % 250 == 0

  end

  sql = "INSERT INTO dailies (wban, yearMonthDay, tmax, tmin, tavg, depart, dewPoint, sunrise, sunset, codeSum, depth, snowFall, precipTotal, resultSpeed, resultDir, avgSpeed, max5Speed, max5Dir, max2Speed, max2Dir, created_at, updated_at) VALUES " + array.join(", ")
  ActiveRecord::Base.connection.execute(sql)

  puts "---------"
  puts "#{count} total entries added."

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

      station = Station.find_by(wban: wban)

      array << "(#{wban}, #{yearMonth}, #{avgMaxTemp}, #{departureMaxTemp}, #{avgMinTemp}, #{departureMinTemp}, #{avgTemp}, #{departureFromNormal}, #{totalMonthlyPrecip}, #{departureFromNormalPrecip}, #{totalSnowfall}, #{max24HrSnowfall}, #{dateMax24HrSnowfall}, #{daysWithPrecip_GE_p01inch}, #{daysWithPrecip_GE_p10inch}, #{daysWithSnowfall_GE_1p0inch}, #{time}, #{time})"



      append station info by foreign_key of "wban"
      # m.station = Station.find_by(wban: wban)
      # m.save
    end

    count += 1
    puts "#{Time.now - t} s: #{count} entries added" if count % 250 == 0

  end

  sql = "INSERT INTO monthlies (wban, yearMonth, avgMaxTemp, departureMaxTemp, avgMinTemp, departureMinTemp, avgTemp, departureFromNormal, totalMonthlyPrecip, departureFromNormalPrecip, totalSnowfall, max24HrSnowfall, dateMax24HrSnowfall, daysWithPrecip_GE_p01inch, daysWithPrecip_GE_p10inch, daysWithSnowfall_GE_1p0inch, created_at, updated_at, station) VALUES " + array.join(", ")
  ActiveRecord::Base.connection.execute(sql)

  puts "---------"
  puts "#{count} total entries added."

end

namespace :app do

  desc "scrape stations"
  task :scrape_stations => :environment do
    t = Time.now
    scrape_stations("/Users/flatironschool/Downloads/QCLCD_Gathered/201706station.txt", t)
    scrape_stations("/Users/flatironschool/Downloads/QCLCD_Gathered/200705station.txt", t)
    # delete duplicates by WBAN
    ActiveRecord::Base.connection.execute("delete from stations where id not in (select max(id) from stations group by wban)")
    t2 = Time.now
    puts "\nMigration ended at #{Time.now} and took #{(t2 - t) / 60} minutes #{(t2 - t) % 60} seconds)."
    puts "There are now #{Station.all.count} stations."
  end

  desc "scrape hourlies"
  task :scrape_hourlies => :environment do
    t = Time.now
    scrape_hourlies("/Users/flatironschool/Downloads/QCLCD_Gathered/201705hourly.txt", t)
    t2 = Time.now
    puts "\nMigration ended at #{Time.now} and took #{(t2 - t) / 60} minutes #{(t2 - t) % 60} seconds)."
    puts "There are now #{Hourly.all.count} hourly datapoints."
  end

  desc "scrape dailies"
  task :scrape_dailies => :environment do
    t = Time.now
    scrape_dailies("/Users/flatironschool/Downloads/QCLCD_Gathered/201705daily.txt", t)
    t2 = Time.now
    puts "\nMigration ended at #{Time.now} and took #{(t2 - t) / 60} minutes #{(t2 - t) % 60} seconds)."
    puts "There are now #{Daily.all.count} daily datapoints."
  end

  desc "scrape monthlies"
  task :scrape_monthlies => :environment do
    t = Time.now
    scrape_monthlies("/Users/flatironschool/Downloads/QCLCD_Gathered/201706monthly.txt", t)
    t2 = Time.now
    puts "\nMigration ended at #{Time.now} and took #{(t2 - t) / 60} minutes #{(t2 - t) % 60} seconds)."
    puts "There are now #{Monthly.all.count} monthly datapoints."
  end
end
