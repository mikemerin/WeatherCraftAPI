class DailiesController < ApplicationController

  def index
    @dailies = Daily.all
  end

  def new
    @daily = Daily.new
  end

  def create
    @daily = Daily.create(daily_params)
  end

  def show
    @daily = Daily.find_by(id: params[:id])
  end

  def edit
    @daily = Daily.find_by(id: params[:id])
  end

  def update
    @daily = Daily.find_by(id: params[:id])
    @daily.update(daily_params)
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
