class CreateDailies < ActiveRecord::Migration[5.1]
  def change
    create_table :dailies do |t|
      t.string :wban
      t.string :year_month_day
      t.string :tmax
      t.string :tmin
      t.string :tavg
      t.string :depart
      t.string :dew_point
      t.string :sunrise
      t.string :sunset
      t.string :code_sum
      t.string :depth
      t.string :snow_fall
      t.string :precip_total
      t.string :result_speed
      t.string :result_dir
      t.string :avg_speed
      t.string :max5_speed
      t.string :max5_dir
      t.string :max2_speed
      t.string :max2_dir

      t.timestamps
    end
  end
end
