class Api::V1::MonthliesController < ApplicationController

  def index
    @monthlies = Monthly.all
    render json: @monthlies
  end

  def create
    @monthly = Monthly.create(monthly_params)
    render json: @monthly
  end

  def show
    @monthlies = Monthly.where(wban: params[:id])
    render json: @monthlies
  end

  def entry
    @monthly = Monthly.where(wban: params[:wban], year_month: params[:year_month])
    render json: @monthly
  end

  def entry_adjacent
    month = Monthly.find_by(wban: params[:wban], year_month: params[:year_month])[:id]
    monthlies = []
    ActiveRecord::Base.connection.execute("SELECT * FROM monthlies where id < #{month} and wban = '#{params[:wban]}' order by id desc limit 6").reverse_each { |x| monthlies << x }
    ActiveRecord::Base.connection.execute("SELECT * FROM monthlies where id >= #{month} and wban = '#{params[:wban]}' order by id limit 7").each { |x| monthlies << x }
    render json: monthlies
  end

  def entry_yeartoyear
    month = params[:year_month].slice(4,4)
    years = ("2007".."2017").to_a
    monthlies = []
    years.each { |x| monthlies << x+month }
    monthlies.delete_if { |x| x < "200705" || x > "201708" }
    monthlies.map! { |x| Monthly.find_by(wban: params[:wban], year_month: x) }
    render json: monthlies
  end

  def entry_historical
    monthlies = Monthly.where(wban: params[:wban])
    render json: monthlies
  end

  def update
    @monthly = Monthly.find_by(id: params[:id])
    @monthly.update(monthly_params)
    render json: @monthly
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
