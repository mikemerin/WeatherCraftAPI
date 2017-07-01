class Api::V1::DailiesController < ApplicationController

  def index
    @dailies = Daily.all
    render json: @dailies
  end

  def create
    @daily = Daily.create(daily_params)
    render json: @daily
  end

  def show
    @dailies = Daily.where(wban: params[:id])
    render json: @dailies
  end

  def update
    @daily = Daily.find_by(id: params[:id])
    @daily.update(daily_params)
    render json: @daily
  end

  private

  def daily_params
    params.require(:daily).permit(
      :wban,
      :year_month_day,
      :tmax,
      :tmin,
      :tavg,
      :depart,
      :dew_point,
      :sunrise,
      :sunset,
      :code_sum,
      :depth,
      :snow_fall,
      :precip_total,
      :result_speed,
      :result_dir,
      :avg_speed,
      :max5_speed,
      :max5_dir,
      :max2_speed,
      :max2_dir
      )
  end

end
