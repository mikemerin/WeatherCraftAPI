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

  def station
    @daily = Daily.find_by(wban: params[:wban], year_month_day: params[:year_month_day])
    render json: [@daily]
  end

  def station_adjacent
    day = Daily.find_by(wban: params[:wban], year_month_day: params[:year_month_day])[:id]
    dailies = []
    ActiveRecord::Base.connection.execute("SELECT * FROM dailies where id < #{day} and wban = '#{params[:wban]}' order by id desc limit 3").reverse_each { |x| dailies << x }
    ActiveRecord::Base.connection.execute("SELECT * FROM dailies where id >= #{day} and wban = '#{params[:wban]}' order by id limit 4").each { |x| dailies << x }
    render json: dailies
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
