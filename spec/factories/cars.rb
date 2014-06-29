FactoryGirl.define do
  factory :car do
    country 'Germany'
    sequence(:manufacturer) { |n| "car#{n}"  }
    color 'blue'
    year 1990
    mileage 9500
    description 'check out my car'
  end
end
