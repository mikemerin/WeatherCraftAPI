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

  def entry
    @daily = Daily.find_by(wban: params[:wban], year_month_day: params[:year_month_day])
    render json: [@daily]
  end

  def entry_adjacent
    day = Daily.find_by(wban: params[:wban], year_month_day: params[:year_month_day])[:id]
    dailies = []
    ActiveRecord::Base.connection.execute("SELECT * FROM dailies where id < #{day} and wban = '#{params[:wban]}' order by id desc limit 5").reverse_each { |x| dailies << x }
    ActiveRecord::Base.connection.execute("SELECT * FROM dailies where id >= #{day} and wban = '#{params[:wban]}' order by id limit 6").each { |x| dailies << x }
    render json: dailies
  end

  def entry_historical
    date = params[:year_month_day].slice(4,4)
    years = ("2007".."2017").to_a
    dailies = []
    years.each { |x| dailies << x+date }
    dailies.delete_if { |x| x < "20070501" || x > "20170830" }
    dailies.map! { |x| Daily.find_by(wban: params[:wban], year_month_day: x) }
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

# # note: the following code is reserved for future use in indexing. as of now it is depreciated but will be used in the future.

# defentry_adjacent
#   day = Daily.find_by(wban: params[:wban], year_month_day: params[:year_month_day])[:id]
#   @dailies = []
#   (-5..5).to_a.each do |x|
#     @dailies << ActiveRecord::Base.connection.execute("SELECT * FROM dailies where id = #{day + x} and wban = '#{params[:wban]}'")
#   end
#   render json: @dailies
# end

# def entry_historical
#   daily = Daily.find_by(wban: params[:wban], year_month_day: params[:year_month_day])
#   wban = daily.wban.
#   mmdd = "%#{daily.year_month_day.slice(4, 4)}"
#   dailies = ActiveRecord::Base.connection.execute("SELECT * FROM dailies where wban = '#{wban}' and year_month_day LIKE '#{mmdd}' limit 10")
#   render json: dailies
# end

# def update
#   @daily = Daily.where(wban: '94728', year_month_day: dailies).limit(dailies.size)
#   render json: @daily
# end
