class MonthliesController < ApplicationController

  def index
    @monthlies = Monthly.all
  end

  def new
    @monthly = Monthly.new
  end

  def create
    @monthly = Monthly.create(monthly_params)
  end

  def show
    @monthly = Monthly.find_by(id: params[:id])
  end

  def edit
    @monthly = Monthly.find_by(id: params[:id])
  end

  def update
    @monthly = Monthly.find_by(id: params[:id])
    @monthly.update(monthly_params)
  end

  private

  def monthly_params
    params.require(:monthly).permit(
        :wban,
        :year_month,
        :avg_max_temp,
        :departure_max_temp,
        :avg_min_temp,
        :departure_min_temp,
        :avg_temp,
        :departure_from_normal,
        :total_monthly_precip,
        :departure_from_normal_precip,
        :max24_hr_precip,
        :date_max24_hr_precip,
        :total_snowfall,
        :max24_hr_snowfall,
        :date_max24_hr_snowfall,
        :days_with_precip_ge_p01inch,
        :days_with_precip_ge_p10inch,
        :days_with_snowfall_ge_1p0inch
        )
  end

end
