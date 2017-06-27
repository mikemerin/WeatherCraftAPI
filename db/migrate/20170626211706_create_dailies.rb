class CreateDailies < ActiveRecord::Migration[5.1]
  def change
    create_table :dailies do |t|
      t.string :wban
      t.string :yearMonthDay
      t.string :tmax
      t.string :tmin
      t.string :tavg
      t.string :depart
      t.string :dewPoint
      t.string :sunrise
      t.string :sunset
      t.string :codeSum
      t.string :depth
      t.string :snowFall
      t.string :precipTotal
      t.string :resultSpeed
      t.string :resultDir
      t.string :avgSpeed
      t.string :max5Speed
      t.string :max5Dir
      t.string :max2Speed
      t.string :max2Dir

      t.timestamps
    end
  end
end
