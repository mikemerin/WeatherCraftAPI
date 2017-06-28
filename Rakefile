# rake db:create && rake db:migrate && rake db:migrate RAILS_ENV=development

require_relative 'config/application'

Rails.application.load_tasks

def scrape_stations(file)

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

def scrape_hourlies(file)

  File.foreach(file) do |row|
    split_row = row.split(",")

    if row != File.foreach(file).first
      wban, date, time, stationType, skyCondition, skyConditionFlag, visibility, visibilityFlag, weatherType, weatherTypeFlag, dryBulbFarenheit, dryBulbFarenheitFlag, dryBulbCelsius, dryBulbCelsiusFlag, wetBulbFarenheit, wetBulbFarenheitFlag, wetBulbCelsius, wetBulbCelsiusFlag, dewPointFarenheit, dewPointFarenheitFlag, dewPointCelsius, dewPointCelsiusFlag, relativeHumidity, relativeHumidityFlag, windSpeed, windSpeedFlag, windDirection, windDirectionFlag, valueForWindCharacter, valueForWindCharacterFlag, stationPressure, stationPressureFlag, pressureTendency, pressureTendencyFlag, pressureChange, pressureChangeFlag, seaLevelPressure, seaLevelPressureFlag, recordType, recordTypeFlag, hourlyPrecip, hourlyPrecipFlag, altimeter, altimeterFlag = split_row

      h = Hourly.new(wban: wban, date: date, time: time, skyCondition: skyCondition, visibility: visibility, weatherType: weatherType, dryBulbFarenheit: dryBulbFarenheit, dewPointFarenheit: dewPointFarenheit, relativeHumidity: relativeHumidity, windSpeed: windSpeed, windDirection: windDirection, hourlyPrecip: hourlyPrecip)

      # append station info by foreign_key of "wban"
      h.station = Station.find_by(wban: wban)
      h.save
    end
  end
end


def scrape_dailies(file)

  File.foreach(file) do |row|
    split_row = row.split(",")

    if row != File.foreach(file).first
      wban, yearMonthDay, tmax, tmaxFlag, tmin, tminFlag, tavg, tavgFlag, depart, departFlag, dewPoint, dewPointFlag, wetBulb, wetBulbFlag, heat, heatFlag, cool, coolFlag, sunrise, sunriseFlag, sunset, sunsetFlag, codeSum, codeSumFlag, depth, depthFlag, water1, water1Flag, snowFall, snowFallFlag, precipTotal, precipTotalFlag, stnPressure, stnPressureFlag, seaLevel, seaLevelFlag, resultSpeed, resultSpeedFlag, resultDir, resultDirFlag, avgSpeed, avgSpeedFlag, max5Speed, max5SpeedFlag, max5Dir, max5DirFlag, max2Speed, max2SpeedFlag, max2Dir, max2DirFlag = split_row

      d = Daily.new(wban: wban, yearMonthDay: yearMonthDay, tmax: tmax, tmin: tmin, tavg: tavg, depart: depart, dewPoint: dewPoint, sunrise: sunrise, sunset: sunset, codeSum: codeSum, depth: depth, snowFall: snowFall, precipTotal: precipTotal, resultSpeed: resultSpeed, resultDir: resultDir, avgSpeed: avgSpeed, max5Speed: max5Speed, max5Dir: max5Dir, max2Speed: max2Speed, max2Dir: max2Dir)

      # append station info by foreign_key of "wban"
      d.station = Station.find_by(wban: wban)
      d.save
    end
  end
end

def scrape_monthlies(file)

  File.foreach(file) do |row|
    split_row = row.split(",")

    if row != File.foreach(file).first
      wban, yearMonth, avgMaxTemp, departureMaxTemp, avgMinTemp, departureMinTemp, avgTemp, departureFromNormal, avgDewPoint, avgWetBulb, heatingDegreeDays, coolingDegreeDays, hDDMonthlyDeparture, cDDMonthlyDeparture, hDDSeasonToDate, cDDSeasonToDate, hDDSeasonToDateDeparture, cDDSeasonToDateDeparture, meanStationPressure, meanSeaLevelPressure, maxSeaLevelPressure, dateMaxSeaLevelPressure, timeMaxSeaLevelPressure, minSeaLevelPressure, dateMinSeaLevelPressure, timeMinSeaLevelPressure, totalMonthlyPrecip, departureFromNormalPrecip, max24HrPrecip, dateMax24HrPrecip, totalSnowfall, max24HrSnowfall, dateMax24HrSnowfall, max12ZSnowDepth, dateMax12ZSnowDepth, maxTemp_GE_90Days, maxTemp_LE_32Days, minTemp_LE_32Days, minTemp_LE_0Days, thunderstormDays, heavyFogDays, daysWithPrecip_GE_p01inch, daysWithPrecip_GE_p10inch, daysWithSnowfall_GE_1p0inch, waterEquivalent, resultantWindSpeed, resultantWindDirection, avgWindSpeed, avgHDD, avgCDD = split_row

      m = Monthly.new(wban: wban, yearMonth: yearMonth, avgMaxTemp: avgMaxTemp, departureMaxTemp: departureMaxTemp, avgMinTemp: avgMinTemp, departureMinTemp: departureMinTemp, avgTemp: avgTemp, departureFromNormal: departureFromNormal, totalMonthlyPrecip: totalMonthlyPrecip, departureFromNormalPrecip: departureFromNormalPrecip, totalSnowfall: totalSnowfall, max24HrSnowfall: max24HrSnowfall, dateMax24HrSnowfall: dateMax24HrSnowfall, daysWithPrecip_GE_p01inch: daysWithPrecip_GE_p01inch, daysWithPrecip_GE_p10inch: daysWithPrecip_GE_p10inch, daysWithSnowfall_GE_1p0inch: daysWithSnowfall_GE_1p0inch)

      # append station info by foreign_key of "wban"
      m.station = Station.find_by(wban: wban)
      m.save
    end
  end
end



namespace :app do

  desc "scrape stations"
  task :scrape_stations => :environment do
    scrape_stations("/Users/flatironschool/Downloads/QCLCD201706/201706station.txt")
  end

  desc "scrape hourlies"
  task :scrape_hourlies => :environment do
    scrape_hourlies("/Users/flatironschool/Downloads/QCLCD_Gathered/200705hourly.txt")
  end

  desc "scrape dailies"
  task :scrape_dailies => :environment do
    scrape_dailies("/Users/flatironschool/Downloads/QCLCD201706/201706daily.txt")
  end

  desc "scrape monthlies"
  task :scrape_monthlies => :environment do
    scrape_monthlies("/Users/flatironschool/Downloads/QCLCD_Gathered/200705station.txt")
    scrape_monthlies("/Users/flatironschool/Downloads/QCLCD_Gathered/201706station.txt")
  end

end
