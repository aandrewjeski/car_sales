class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(id: :desc).limit('20')
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      flash[:notice] = "Success!"
      redirect_to manufacturers_path(@manufacturers)
    else
      flash.now[:notice] = "Your manufacturer couldn't be saved."
      render :new
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
