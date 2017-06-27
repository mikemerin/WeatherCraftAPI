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
      :yearMonthDay,
      :tmax,
      :tmin,
      :tavg,
      :depart,
      :dewPoint,
      :sunrise,
      :sunset,
      :codeSum,
      :depth,
      :snowFall,
      :precipTotal,
      :resultSpeed,
      :resultDir,
      :avgSpeed,
      :max5Speed,
      :max5Dir,
      :max2Speed,
      :max2Dir
      )
  end

end
