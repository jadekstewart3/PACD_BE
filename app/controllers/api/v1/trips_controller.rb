class Api::V1::TripsController < ApplicationController
  def index
    render json: TripSerializer.new(Trip.all)
  end

  def show
    render json: TripSerializer.new(Trip.find(params[:id]))
  end

  def create
    trip = Trip.create!(trip_params)
    render json: TripSerializer.new(trip)
  end

  private

  def trip_params
    params.permit(:name, :start_date, :end_date)
  end
end