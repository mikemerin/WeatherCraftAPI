class CreateHourlies < ActiveRecord::Migration[5.1]
  def change
    create_table :hourlies do |t|
      t.string :wban
      t.string :date
      t.string :time
      t.string :sky_condition
      t.string :visibility
      t.string :weather_type
      t.string :dry_bulb_farenheit
      t.string :dew_point_farenheit
      t.string :relative_humidity
      t.string :wind_speed
      t.string :wind_direction
      t.string :hourly_precip

      t.timestamps
    end
  end
end
