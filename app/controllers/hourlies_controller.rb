class HourliesController < ApplicationController

  def index
    @hourlies = Hourly.all
  end

  def new
    @hourly = Hourly.new
  end

  def create
    @hourly = Hourly.create(hourly_params)
  end

  def show
    @hourly = Hourly.find_by(id: params[:id])
  end

  def edit
    @hourly = Hourly.find_by(id: params[:id])
  end

  def update
    @hourly = Hourly.find_by(id: params[:id])
    @hourly.update(hourly_params)
  end

  private

  def hourly_params
    params.require(:hourly).permit(
        :wban,
        :date,
        :time,
        :skyCondition,
        :visibility,
        :weatherType,
        :dryBulbFarenheit,
        :dryBulbCelsius,
        :dewPointFarenheit,
        :dewPointCelsius,
        :relativeHumidity,
        :windSpeed,
        :windDirection,
        :hourlyPrecip,
        )
  end

end
