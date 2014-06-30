require 'rails_helper'

feature 'user adds a new manufacturer', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

  scenario 'user adds a new manufacturer' do
    manufacturer = Manufacturer.create(name: 'GM',
      country: 'USA' )

    visit "/manufacturers/new"
    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Submit'

    expect(page).to have_content 'Success'
    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country
  end

  scenario 'without required attributes' do
    visit '/television_shows/new'
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "can't be blank"
  end

end
