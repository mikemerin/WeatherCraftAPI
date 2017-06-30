class StationsController < ApplicationController

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.create(station_params)
  end

  def show
    @station = Station.find_by(id: params[:id])
  end

  def edit
    @station = Station.find_by(id: params[:id])
  end

  def update
    @station = Station.find_by(id: params[:id])
    @station.update(station_params)
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
