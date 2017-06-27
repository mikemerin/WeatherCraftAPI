class CreateHourlies < ActiveRecord::Migration[5.1]
  def change
    create_table :hourlies do |t|
      t.string :wban
      t.string :date
      t.string :time
      t.string :skyCondition
      t.string :visibility
      t.string :weatherType
      t.string :dryBulbFarenheit
      t.string :dryBulbCelsius
      t.string :dewPointFarenheit
      t.string :dewPointCelsius
      t.string :relativeHumidity
      t.string :windSpeed
      t.string :windDirection
      t.string :hourlyPrecip

      t.timestamps
    end
  end
end
