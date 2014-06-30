require 'rails_helper'

feature 'user views list of cars', %Q{
  As a car salesperson
  I want to view a list of cars
  So I know which ones I have
} do

  scenario 'user views cars' do
    cars = Car.create(name: 'Avalon', manufacturer: 'Toyota',
    color: 'silver', year: 2014, mileage: 1000)

    visit cars_path

    expect(page).to have_content 'Avalon'
    expect(page).to have_content 'Toyota'
    expect(page).to have_content 'silver'
    expect(page).to have_content '2014'
    expect(page).to have_content '1000'

  end
end
