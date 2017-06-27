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
        :departurefromNormal,
        :totalMonthlyPrecip,
        :departureFromNormalPrecip,
        :totalSnowfall,
        :max24HrSnowfall,
        :dateMax24HrSnowfall,
        :daysWithPrecip_01inch,
        :daysWithPrecip_10inch,
        :daysWithSnowfall_1inch
        )
  end

end
