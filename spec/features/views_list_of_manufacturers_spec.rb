require 'rails_helper'

feature 'user views list of manufacturers', %Q{
  As a site visitor
  I want to view a list of manufacturers
  So I know which ones exist
} do

  scenario 'user views manufacturers' do
    manufacturers = Manufacturer.create(name: 'GM',
      country: 'USA' )

    visit manufacturers_path

    expect(page).to have_content 'GM'
    expect(page).to have_content 'USA'

  end
end
