class CarsController < ApplicationController
  def new
    @car= Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "You've successfully registered your vehicle"
      redirect_to cars_path
    else
      flash[:notice] = "Your input has invalid information, try again"
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer, :color, :year, :mileage, :description)
  end
end
