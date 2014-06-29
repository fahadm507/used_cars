require 'spec_helper'

feature 'user finds and fills out new car listing form' do

  scenario 'fill out vehicle listing form with valid input' do

    visit new_car_path

    fill_in 'Country', with: 'Germany'
    fill_in 'Manufacturer', with: 'BMW'
    fill_in 'Color', with: 'blue'
    fill_in 'Year', with: 1995
    fill_in 'Mileage', with: 75000
    fill_in 'Description', with: 'This is sa good car'

    click_button 'Register'

    expect(page).to have_content "You've successfully listed your vehicle"

  end

  scenario 'fill out the car listing from without invalid input' do
    visit new_car_path

    fill_in 'Country', with: 'Germany'
    fill_in 'Manufacturer', with: '234'
    fill_in 'Color', with: 'blue'
    fill_in 'Year', with: 'dammy'
    fill_in 'Mileage', with: 'data'
    fill_in 'Description', with: 'This is sa good car'

    click_button 'Register'
    expect(page).to have_content 'Your input has invalid information, try again'

  end

  scenario 'user submits empty form without required input' do
    visit new_car_path

    fill_in 'Country', with: ''
    fill_in 'Manufacturer', with: ''
    fill_in 'Color', with: ''
    fill_in 'Year', with:''
    fill_in 'Mileage', with:''
    fill_in 'Description', with: 'This is a good car'

    click_button 'Register'

    expect(page).to have_content "Your input has invalid information, try again"
    expect(page).to have_content "Countrycan't be blank"
    expect(page).to have_content "Manufacturercan't be blank"
    expect(page).to have_content "Colorcan't be blank"
    expect(page).to have_content "Yearcan't be blank, is not a number"
    expect(page).to have_content "Mileagecan't be blank"
    expect(page).to have_content "DescriptionThis is a good car"
  end

  scenario 'user submits form with unacceptable year' do
    visit new_car_path

    fill_in 'Country', with: 'Japan'
    fill_in 'Manufacturer', with: 'Toyota'
    fill_in 'Color', with: 'blue'
    fill_in 'Mileage', with: 75000
    fill_in 'Description', with: 'This is sa good car'
    fill_in 'Year', with: 1916

    click_button 'Register'

    expect(page).to have_content "Your input has invalid information, try again"
    expect(page).to have_content "must be greater than or equal to 1920"
  end
end
