# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

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


def scrape_monthlies(file)

  File.foreach(file) do |row|
    split_row = row.split(",")

    if row != File.foreach(file).first
      wban, yearMonth, avgMaxTemp, departureMaxTemp, avgMinTemp, departureMinTemp, avgTemp, departurefromNormal, avgDewPoint, avgWetBulb, heatingDegreeDays, coolingDegreeDays, hDDMonthlyDeparture, cDDMonthlyDeparture, hDDSeasonToDate, cDDSeasonToDate, hDDSeasonToDateDeparture, cDDSeasonToDateDeparture, meanStationPressure, meanSeaLevelPressure, maxSeaLevelPressure, dateMaxSeaLevelPressure, timeMaxSeaLevelPressure, minSeaLevelPressure, dateMinSeaLevelPressure, timeMinSeaLevelPressure, totalMonthlyPrecip, departureFromNormalPrecip, max24HrPrecip, dateMax24HrPrecip, totalSnowfall, max24HrSnowfall, dateMax24HrSnowfall, max12ZSnowDepth, dateMax12ZSnowDepth, maxTemp_GE_90Days, maxTemp_LE_32Days, minTemp_LE_32Days, minTemp_LE_0Days, thunderstormDays, heavyFogDays, daysWithPrecip_GE_p01inch, daysWithPrecip_GE_p10inch, daysWithSnowfall_GE_1p0inch, waterEquivalent, resultantWindSpeed, resultantWindDirection, avgWindSpeed, avgHDD, avgCDD = split_row
      Monthly.new(wban: wban, yearMonth: yearMonth, avgMaxTemp: avgMaxTemp, departureMaxTemp: departureMaxTemp, avgMinTemp: avgMinTemp, departureMinTemp: departureMinTemp, avgTemp: avgTemp, departurefromNormal: departurefromNormal, totalMonthlyPrecip: totalMonthlyPrecip, departureFromNormalPrecip: departureFromNormalPrecip, totalSnowfall: totalSnowfall, max24HrSnowfall: max24HrSnowfall, dateMax24HrSnowfall: dateMax24HrSnowfall, daysWithPrecip_GE_p01inch: daysWithPrecip_GE_p01inch, daysWithPrecip_GE_p10inch: daysWithPrecip_GE_p10inch, daysWithSnowfall_GE_1p0inch: daysWithSnowfall_GE_1p0inch)
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
    scrape_hourlies("/Users/flatironschool/Downloads/QCLCD201706/201706hourly.txt")
  end

  desc "scrape dailies"
  task :scrape_dailies => :environment do
    scrape_dailies("/Users/flatironschool/Downloads/QCLCD201706/201706daily.txt")
  end

  desc "scrape monthlies"
  task :scrape_monthlies => :environment do
    scrape_monthlies("/Users/flatironschool/Downloads/QCLCD201705/201705monthly.txt")
  end

end
