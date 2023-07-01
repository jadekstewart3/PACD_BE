class Api::V1::TripsController < ApplicationController
  def index
    render json: TripSerializer.new(Trip.all)
  end

  def show
    render json: TripSerializer.new(Trip.find(params[:id]))
  end
end