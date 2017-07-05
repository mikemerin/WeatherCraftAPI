class Api::V1::HourliesController < ApplicationController

  def index
    @hourlies = Hourly.all
    render json: @hourlies
  end

  def create
    @hourly = Hourly.create(hourly_params)
    render json: @hourly
  end

  def show
    @hourlies = Hourly.where(wban: params[:id])
    render json: @hourlies
  end

  def station
    @hourly = Hourly.find_by(wban: params[:wban], date: params[:date])
    render json: @hourly
  end

  def update
    @hourly = Hourly.find_by(id: params[:id])
    @hourly.update(hourly_params)
    render json: @hourly
  end

  private

  def hourly_params
    params.require(:hourly).permit(
        :wban,
        :date,
        :time,
        :sky_condition,
        :visibility,
        :weather_type,
        :dry_bulb_farenheit,
        :dew_point_farenheit,
        :relative_humidity,
        :wind_speed,
        :wind_direction,
        :hourly_precip
        )
  end

end
