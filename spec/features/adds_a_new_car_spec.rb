require 'rails_helper'

feature 'user adds a new manufacturer', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  scenario 'user adds a new car' do
    car = Car.new(name: 'Avalon', manufacturer: 'Toyota',
    color: 'silver', year: 2014, mileage: 1000)

    visit new_car_path
    fill_in 'Model', with: car.name
    fill_in 'Manufacturer', with: car.manufacturer
    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    click_on 'Submit'

    expect(page).to have_content 'Success!'
    expect(page).to have_content car.name
    expect(page).to have_content car.manufacturer
    expect(page).to have_content car.color
    expect(page).to have_content car.year
    expect(page).to have_content car.mileage
  end

  scenario 'without required attributes' do
    visit new_car_path
    click_on 'Submit'

    expect(page).to_not have_content 'Success!'
    expect(page).to have_content "can't be blank"
  end

end
