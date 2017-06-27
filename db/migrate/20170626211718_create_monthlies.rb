class CreateMonthlies < ActiveRecord::Migration[5.1]
  def change
    create_table :monthlies do |t|
      t.string :wban
      t.string :yearMonth
      t.string :avgMaxTemp
      t.string :departureMaxTemp
      t.string :avgMinTemp
      t.string :departureMinTemp
      t.string :avgTemp
      t.string :departurefromNormal
      t.string :totalMonthlyPrecip
      t.string :departureFromNormalPrecip
      t.string :totalSnowfall
      t.string :max24HrSnowfall
      t.string :dateMax24HrSnowfall
      t.string :daysWithPrecip_GE_p01inch
      t.string :daysWithPrecip_GE_p10inch
      t.string :daysWithSnowfall_GE_1p0inch

      t.timestamps
    end
  end
end
