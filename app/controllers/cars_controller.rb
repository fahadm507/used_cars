class CarsController < ApplicationController

  def index
    @cars = Car.all.order("created_at DESC").limit(10)
  end

  def new
    @car= Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "You've successfully listed your vehicle"
      redirect_to cars_path
    else
      flash[:notice] = "Your input has invalid information, try again"
      render :'new'
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer, :color, :year, :mileage, :description, :country)
  end
end
