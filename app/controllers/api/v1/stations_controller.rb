class Api::V1::StationsController < ApplicationController

  def index
    @stations = Station.all
    render json: @stations
  end

  def create
    @station = Station.create(station_params)
    render json: @station
  end

  def show
    if params[:id].match(/\d/)
      @station = Station.find_by(wban: params[:id])
    else
      @station = Station.find_by(callsign: params[:id].upcase)
    end
    render json: @station
  end

  def update
    @station = Station.find_by(id: params[:id])
    @station.update(station_params)
    render json: @station
  end

  private

  def station_params
    params.require(:station).permit(
        :wban,
        :name,
        :callsign,
        :state,
        :location,
        :latitude,
        :longitude,
        :ground_height,
        :station_height
        )
  end

end
