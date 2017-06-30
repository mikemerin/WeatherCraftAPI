class CreateMonthlies < ActiveRecord::Migration[5.1]
  def change
    create_table :monthlies do |t|
      t.string :wban
      t.string :year_month
      t.string :avg_max_temp
      t.string :departure_max_temp
      t.string :avg_min_temp
      t.string :departure_min_temp
      t.string :avg_temp
      t.string :departure_from_normal
      t.string :total_monthly_precip
      t.string :departure_from_normal_precip
      t.string :max24_hr_precip
      t.string :date_max24_hr_precip
      t.string :total_snowfall
      t.string :max24_hr_snowfall
      t.string :date_max24_hr_snowfall
      t.string :days_with_precip_ge_p01inch
      t.string :days_with_precip_ge_p10inch
      t.string :days_with_snowfall_ge_1p0inch

      t.timestamps
    end

  end
end
