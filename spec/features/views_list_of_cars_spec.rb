require 'rails_helper'

feature 'user views list of cars', %Q{
  As a care salesman
  I want to view a list of cars
  So I know which ones I have
} do

  scenario 'user views cars' do
    cars = Car.create(name: 'Avalon', manufacturer: 'Toyota',
    color: 'silver', year: 2014, mileage: 1000)

    visit '/cars'
    cars.each do |car|
      expect(page).to have_content car.name
      expect(page).to have_content car.manufacturer
      expect(page).to have_content car.color
      expect(page).to have_content car.year
      expect(page).to have_content car.mileage
    end
  end
end
