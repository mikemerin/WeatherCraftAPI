# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

def scrape_stations(read_file)

  File.foreach(read_file) do |row|
    unless row[0] == "|"
      split_row = row.split("|")

      if row != File.foreach(read_file).first
        wban, wmo, callsign, climatedivisioncode, climatedivisionstatecode, climatedivisionstationcode, name, state, location, latitude, longitude, groundheight, stationheight, barometer, timezone = split_row
        Station.create(wban: wban, callsign: callsign, name: name, state: state, location: location, latitude: latitude, longitude: longitude, groundHeight: groundheight)
      end
    end
  end

end



namespace :app do
  desc "scrape stations"
  task :scrape_stations => :environment do
    scrape_stations("/Users/flatironschool/Downloads/QCLCD201706/201706station.txt")
  end
end
