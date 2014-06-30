require 'rails_helper'

feature 'user views list of manufacturers', %Q{
  As a site visitor
  I want to view a list of manufacturers
  So I know which ones exist
} do

  scenario 'user views manufacturers' do
    manufacturer = Manufacturer.create(name: 'GM',
      country: 'USA' )

    visit '/manufacturers'
    manufacturers.each do |manufacturer|
      expect(page).to have_content manufacturer.name
      expect(page).to have_content manufacturer.country
    end
  end
end
