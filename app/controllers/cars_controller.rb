class CarsController < ApplicationController
  def index
    @cars = Car.order(id: :desc).limit('20')
  end

  def show
    @car = car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      flash[:notice] = "Success!"
      redirect_to cars_path
    else
      flash.now[:notice] = "Your car couldn't be saved."
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer, :color, :year, :mileage)
  end
end
