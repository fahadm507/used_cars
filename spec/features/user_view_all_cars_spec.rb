require 'spec_helper'

feature 'User views all listed used cars' do

  scenario 'lists the ten most recent registered cars' do

    visit new_car_path

    cars = FactoryGirl.create_list(:car, 10)
    fill_in 'Country', with: 'Germany'
    fill_in 'Manufacturer', with: 'BMW'
    fill_in 'Color', with: 'blue'
    fill_in 'Year', with: 1995
    fill_in 'Mileage', with: 75000
    fill_in 'Description', with: 'This is sa good car'

    click_button 'Register'

    cars.each do |car|
        expect(page).to have_content(car.country)
        expect(page).to have_content(car.manufacturer)
        expect(page).to have_content(car.color)
        expect(page).to have_content(car.year)
        expect(page).to have_content(car.mileage)
        car.description
    end
  end
end
