class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :wban
      t.string :name
      t.string :callsign
      t.string :state
      t.string :location
      t.string :latitude
      t.string :longitude
      t.string :groundHeight
      t.string :stationHeight
      t.index [:wban], name: "index_stations_on_wban"

      t.timestamps
    end
  end
end
