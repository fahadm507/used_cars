require 'spec_helper'

feature 'user finds and fills out new car registration form' do
#   As a car salesperson
#   I want to record a newly acquired car
#   So that I can list it in my lot
#   Acceptance Criteria:

# I must specify the manufacturer, color, year, and mileage of the car.
# Only years from 1920 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success
# If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# Upon successfully creating a car, I am redirected back to the index of cars.

  scenario 'fill out vehicle registration form with valid input' do

    visit new_car_path

    fill_in 'Manufacturer', with: 'BMW'
    fill_in 'Color', with: 'blue'
    fill_in 'Year', with: 1995
    fill_in 'Mileage', with: 75000
    fill_in 'Description', with: 'This is sa good car'

    click_button 'Register'

    expect(page).to have_content "You've successfully registered your vehicle"

  end

end
