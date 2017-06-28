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
        :yearMonth,
        :avgMaxTemp,
        :departureMaxTemp,
        :avgMinTemp,
        :departureMinTemp,
        :avgTemp,
        :departureFromNormal,
        :totalMonthlyPrecip,
        :departureFromNormalPrecip,
        :totalSnowfall,
        :max24HrSnowfall,
        :dateMax24HrSnowfall,
        :daysWithPrecip_GE_p01inch,
        :daysWithPrecip_GE_p10inch,
        :daysWithSnowfall_GE_1p0inch
        )
  end

end
